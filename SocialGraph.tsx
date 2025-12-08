
import React, { useEffect, useRef, useState } from 'react';
import { THEME } from './constants';
import { Icon } from './Icon';
import { SharedProps } from './types';

interface Point3D {
  x: number;
  y: number;
  z: number;
  id: string;
  name: string;
  avatarColor: string;
  connections: number[]; // Indices of connected nodes
}

export const SocialGraph = ({ lang, t }: SharedProps) => {
  const canvasRef = useRef<HTMLCanvasElement>(null);
  const [selectedUser, setSelectedUser] = useState<Point3D | null>(null);
  const [rotation, setRotation] = useState({ x: 0, y: 0 });
  const isDragging = useRef(false);
  const lastMousePos = useRef({ x: 0, y: 0 });
  const pointsRef = useRef<Point3D[]>([]);
  const projectedPointsRef = useRef<any[]>([]);

  // Generate sphere points
  useEffect(() => {
    const numPoints = 50;
    const points: Point3D[] = [];
    const phi = Math.PI * (3 - Math.sqrt(5)); // Golden angle

    for (let i = 0; i < numPoints; i++) {
      const y = 1 - (i / (numPoints - 1)) * 2; // y goes from 1 to -1
      const radius = Math.sqrt(1 - y * y);
      const theta = phi * i;
      const x = Math.cos(theta) * radius;
      const z = Math.sin(theta) * radius;
      
      points.push({
        x: x * 150, // Scale radius
        y: y * 150,
        z: z * 150,
        id: `user-${i}`,
        name: `User ${i + 1}`,
        avatarColor: `hsl(${Math.random() * 360}, 70%, 50%)`,
        connections: []
      });
    }

    // Create connections based on distance
    points.forEach((p, i) => {
      points.forEach((p2, j) => {
        if (i === j) return;
        const dist = Math.sqrt(Math.pow(p.x - p2.x, 2) + Math.pow(p.y - p2.y, 2) + Math.pow(p.z - p2.z, 2));
        // Connect if close enough to form a mesh
        if (dist < 70 && p.connections.length < 6) {
           p.connections.push(j);
        }
      });
    });

    pointsRef.current = points;
  }, []);

  // Animation Loop
  useEffect(() => {
    const canvas = canvasRef.current;
    if (!canvas) return;
    const ctx = canvas.getContext('2d');
    if (!ctx) return;

    let animationId: number;

    const render = () => {
      ctx.clearRect(0, 0, canvas.width, canvas.height);
      const centerX = canvas.width / 2;
      const centerY = canvas.height / 2;
      
      // Auto rotate slowly if not dragging
      if (!isDragging.current) {
        setRotation(prev => ({ x: prev.x + 0.002, y: prev.y + 0.001 }));
      }

      // 3D Projection Logic
      const projectedPoints = pointsRef.current.map(p => {
        // Rotation Matrix
        let { x, y, z } = p;
        
        // Rotate Y
        const cosY = Math.cos(rotation.y);
        const sinY = Math.sin(rotation.y);
        const x1 = x * cosY - z * sinY;
        const z1 = z * cosY + x * sinY;
        
        // Rotate X
        const cosX = Math.cos(rotation.x);
        const sinX = Math.sin(rotation.x);
        const y2 = y * cosX - z1 * sinX;
        const z2 = z1 * cosX + y * sinX;

        // Perspective project
        const scale = 400 / (400 - z2);
        const x2d = x1 * scale + centerX;
        const y2d = y2 * scale + centerY;

        return { ...p, x2d, y2d, scale, z: z2 };
      });

      // Sort by Z for depth sorting (draw back to front)
      projectedPoints.sort((a, b) => a.z - b.z);
      
      // Store for hit testing
      projectedPointsRef.current = projectedPoints;

      // Draw Lines
      ctx.strokeStyle = 'rgba(255, 215, 0, 0.2)'; // Gold lines
      ctx.lineWidth = 1;
      projectedPoints.forEach(p => {
         p.connections.forEach(targetIdx => {
             // Find the projected point of the connection
             const target = projectedPoints.find(pp => pp.id === pointsRef.current[targetIdx].id);
             if (target) {
                 ctx.beginPath();
                 ctx.moveTo(p.x2d, p.y2d);
                 ctx.lineTo(target.x2d, target.y2d);
                 ctx.stroke();
             }
         });
      });

      // Draw Nodes (Hexagons)
      projectedPoints.forEach(p => {
        const size = 6 * p.scale;
        ctx.fillStyle = p.avatarColor;
        ctx.beginPath();
        for (let i = 0; i < 6; i++) {
          const angle = 2 * Math.PI / 6 * i;
          const px = p.x2d + size * Math.cos(angle);
          const py = p.y2d + size * Math.sin(angle);
          if (i === 0) ctx.moveTo(px, py);
          else ctx.lineTo(px, py);
        }
        ctx.closePath();
        ctx.fill();
        
        // Glow effect
        if (p.z > -50) {
            ctx.shadowBlur = 10;
            ctx.shadowColor = p.avatarColor;
            ctx.strokeStyle = 'white';
            ctx.lineWidth = 1 * p.scale;
            ctx.stroke();
            ctx.shadowBlur = 0;
        }
      });

      animationId = requestAnimationFrame(render);
    };

    render();
    return () => cancelAnimationFrame(animationId);
  }, [rotation]);

  const handlePointerDown = (e: React.PointerEvent) => {
    isDragging.current = true;
    lastMousePos.current = { x: e.clientX, y: e.clientY };
  };

  const handlePointerMove = (e: React.PointerEvent) => {
    if (isDragging.current) {
      const deltaX = e.clientX - lastMousePos.current.x;
      const deltaY = e.clientY - lastMousePos.current.y;
      setRotation(prev => ({
        x: prev.x - deltaY * 0.01,
        y: prev.y + deltaX * 0.01
      }));
      lastMousePos.current = { x: e.clientX, y: e.clientY };
    }
  };

  const handlePointerUp = () => {
    isDragging.current = false;
  };
  
  // Accurate hit detection
  const handleClick = (e: React.MouseEvent<HTMLCanvasElement>) => {
     if (isDragging.current) return;
     
     const rect = canvasRef.current?.getBoundingClientRect();
     if (!rect) return;
     const clickX = e.clientX - rect.left;
     const clickY = e.clientY - rect.top;

     // Iterate reversed (front to back) to find the top-most node
     const clickedNode = [...projectedPointsRef.current].reverse().find(p => {
         const dx = clickX - p.x2d;
         const dy = clickY - p.y2d;
         const hitRadius = (8 * p.scale) + 10; // Visual radius + padding
         return (dx*dx + dy*dy) < (hitRadius * hitRadius);
     });

     if (clickedNode) {
         setSelectedUser(clickedNode);
     } else {
         setSelectedUser(null);
     }
  };

  return (
    <div style={{ position: 'relative', width: '100%', height: '100%', overflow: 'hidden', background: 'radial-gradient(circle, #2a1a4a 0%, #121212 100%)' }}>
      <canvas
        ref={canvasRef}
        width={window.innerWidth}
        height={window.innerHeight - 150} // Adjust for headers/nav
        onPointerDown={handlePointerDown}
        onPointerMove={handlePointerMove}
        onPointerUp={handlePointerUp}
        onPointerLeave={handlePointerUp}
        onClick={handleClick}
        style={{ cursor: isDragging.current ? 'grabbing' : 'grab', touchAction: 'none' }}
      />
      
      <div style={{ position: 'absolute', top: 20, left: 20, color: 'white', pointerEvents: 'none' }}>
         <h3>{t('globalNetwork')}</h3>
         <p style={{ fontSize: '12px', opacity: 0.7 }}>{t('swipeRotate')}</p>
      </div>

      {selectedUser && (
        <div style={{
          position: 'absolute', bottom: 20, left: '5%', width: '90%',
          backgroundColor: THEME.surface, padding: '15px', borderRadius: '15px',
          display: 'flex', alignItems: 'center', gap: '15px',
          boxShadow: '0 4px 10px rgba(0,0,0,0.5)',
          animation: 'slideUp 0.3s ease-out'
        }}>
          <div style={{ 
            width: 50, height: 50, borderRadius: '50%', backgroundColor: selectedUser.avatarColor,
            display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: '24px'
          }}>
             ⬢
          </div>
          <div style={{ flex: 1 }}>
            <div style={{ color: 'white', fontWeight: 'bold' }}>{selectedUser.name}</div>
            <div style={{ color: '#aaa', fontSize: '12px' }}>{t('connections')}: {selectedUser.connections.length}</div>
            <div style={{ color: THEME.secondary, fontSize: '12px' }}>{t('sharedInterest')}: Music, Tech</div>
          </div>
          <button 
            onClick={() => setSelectedUser(null)}
            style={{ background: 'none', border: 'none', color: 'white', fontSize: '20px', cursor: 'pointer' }}
          >
            ×
          </button>
        </div>
      )}
    </div>
  );
};
