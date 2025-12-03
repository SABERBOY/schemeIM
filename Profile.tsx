
import React, { useState } from 'react';
import { User } from './types';
import { THEME, AVATAR_FRAMES } from './constants';

export const Profile = ({ user, onUpdateUser }: { user: User, onUpdateUser: (u: User) => void }) => {
  const [isEditing, setIsEditing] = useState(false);
  const [editName, setEditName] = useState(user.name);
  const [showSocial, setShowSocial] = useState<'followers'|'following'|null>(null);

  const getRank = (gold: number) => {
    if (gold < 100) return { name: 'Bronze', color: '#CD7F32' };
    if (gold < 500) return { name: 'Silver', color: '#C0C0C0' };
    if (gold < 2000) return { name: 'Gold', color: '#FFD700' };
    return { name: 'Platinum', color: '#E5E4E2' };
  };

  const rank = getRank(user.gold);

  const handleSave = () => {
    onUpdateUser({ ...user, name: editName });
    setIsEditing(false);
  };

  const randomizeAvatar = () => {
    const colors = ['#F44336', '#E91E63', '#9C27B0', '#673AB7', '#3F51B5', '#2196F3'];
    const randomColor = colors[Math.floor(Math.random() * colors.length)];
    // Simple SVG avatar placeholder
    const svg = `data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='100' height='100' viewBox='0 0 100 100'><rect width='100' height='100' fill='${encodeURIComponent(randomColor)}'/><text x='50' y='50' font-family='Arial' font-size='50' fill='white' text-anchor='middle' dy='.3em'>👤</text></svg>`;
    onUpdateUser({ ...user, avatar: svg });
  };
  
  const togglePrivacy = () => {
    onUpdateUser({
      ...user,
      privacy: { ...user.privacy, showSocialList: !user.privacy?.showSocialList }
    });
  };

  const handleFrameSelect = (frameImage: string) => {
    onUpdateUser({ ...user, frame: frameImage });
  };

  return (
    <div style={{ height: '100%', padding: '20px', overflowY: 'auto' }}>
      <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', marginBottom: '30px' }}>
        <div style={{ position: 'relative', width: 100, height: 100 }}>
          <img 
            src={user.avatar} 
            alt="Profile" 
            style={{ width: '100%', height: '100%', borderRadius: '50%', border: `3px solid ${THEME.secondary}`, boxSizing: 'border-box' }} 
          />
          {user.frame && (
            <img 
              src={user.frame} 
              alt="frame" 
              style={{ position: 'absolute', top: '-10%', left: '-10%', width: '120%', height: '120%', pointerEvents: 'none' }} 
            />
          )}
          
          {isEditing && (
            <button 
              onClick={randomizeAvatar}
              style={{
                position: 'absolute', bottom: 0, right: 0, backgroundColor: THEME.primary,
                border: 'none', borderRadius: '50%', width: 30, height: 30, color: 'white', cursor: 'pointer', zIndex: 10
              }}
            >
              🎲
            </button>
          )}
        </div>
        
        {isEditing ? (
          <div style={{ marginTop: '15px', display: 'flex', gap: '10px' }}>
            <input 
              value={editName}
              onChange={(e) => setEditName(e.target.value)}
              style={{ padding: '8px', borderRadius: '5px', border: 'none' }}
            />
            <button onClick={handleSave} style={{ padding: '8px', borderRadius: '5px', border: 'none', background: THEME.success, color: 'white' }}>Save</button>
          </div>
        ) : (
          <div style={{ marginTop: '15px', textAlign: 'center' }}>
            <h2 style={{ color: 'white', margin: 0 }}>{user.name}</h2>
            <div style={{ color: '#888', marginTop: '5px' }}>ID: {user.id}</div>
            <button 
              onClick={() => setIsEditing(true)}
              style={{ marginTop: '10px', background: 'transparent', border: `1px solid #666`, color: '#AAA', padding: '4px 12px', borderRadius: '15px', fontSize: '0.8rem', cursor: 'pointer' }}
            >
              Edit Profile
            </button>
          </div>
        )}
      </div>

      <div style={{ display: 'flex', justifyContent: 'space-around', marginBottom: '30px' }}>
        <div style={{ textAlign: 'center' }}>
          <div style={{ color: THEME.secondary, fontWeight: 'bold', fontSize: '20px' }}>{user.gold}</div>
          <div style={{ color: '#888', fontSize: '12px' }}>Gold</div>
        </div>
        <div style={{ textAlign: 'center' }}>
           <div style={{ color: rank.color, fontWeight: 'bold', fontSize: '20px' }}>{rank.name}</div>
           <div style={{ color: '#888', fontSize: '12px' }}>Rank</div>
        </div>
        <div style={{ textAlign: 'center', cursor: 'pointer' }} onClick={() => setShowSocial('followers')}>
          <div style={{ color: 'white', fontWeight: 'bold', fontSize: '20px' }}>128</div>
          <div style={{ color: '#888', fontSize: '12px' }}>Followers</div>
        </div>
        <div style={{ textAlign: 'center', cursor: 'pointer' }} onClick={() => setShowSocial('following')}>
          <div style={{ color: 'white', fontWeight: 'bold', fontSize: '20px' }}>45</div>
          <div style={{ color: '#888', fontSize: '12px' }}>Following</div>
        </div>
      </div>

      {/* Frame Shop */}
      <div style={{ backgroundColor: THEME.surface, borderRadius: '15px', padding: '20px', marginBottom: '20px' }}>
        <h3 style={{ color: 'white', marginTop: 0, marginBottom: '15px' }}>Avatar Frames</h3>
        <div style={{ display: 'flex', gap: '15px', overflowX: 'auto', paddingBottom: '10px' }}>
          {AVATAR_FRAMES.map(frame => (
             <div 
              key={frame.id} 
              onClick={() => handleFrameSelect(frame.image)}
              style={{ 
                display: 'flex', flexDirection: 'column', alignItems: 'center', minWidth: '80px', cursor: 'pointer',
                opacity: user.frame === frame.image ? 1 : 0.6
              }}
             >
               <div style={{ position: 'relative', width: 60, height: 60, marginBottom: '5px' }}>
                 <div style={{ width: '100%', height: '100%', borderRadius: '50%', backgroundColor: '#333' }} />
                 {frame.image && (
                   <img src={frame.image} alt={frame.name} style={{ position: 'absolute', top: '-10%', left: '-10%', width: '120%', height: '120%' }} />
                 )}
                 {user.frame === frame.image && (
                   <div style={{ position: 'absolute', bottom: 0, right: 0, backgroundColor: THEME.success, borderRadius: '50%', width: 15, height: 15, border: '2px solid #1E1E1E' }} />
                 )}
               </div>
               <span style={{ color: user.frame === frame.image ? THEME.secondary : 'white', fontSize: '10px' }}>{frame.name}</span>
             </div>
          ))}
        </div>
      </div>

      <div style={{ backgroundColor: THEME.surface, borderRadius: '15px', padding: '20px' }}>
        <h3 style={{ color: 'white', marginTop: 0 }}>Settings</h3>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', padding: '10px 0', borderBottom: '1px solid #333' }}>
          <span style={{ color: 'white' }}>Show Followers Publicly</span>
          <div 
            onClick={togglePrivacy}
            style={{ 
              width: 40, height: 20, backgroundColor: user.privacy?.showSocialList ? THEME.success : '#555', 
              borderRadius: '10px', position: 'relative', cursor: 'pointer' 
            }}
          >
            <div style={{ 
              width: 16, height: 16, backgroundColor: 'white', borderRadius: '50%', 
              position: 'absolute', top: 2, left: user.privacy?.showSocialList ? 22 : 2, transition: '0.3s'
            }} />
          </div>
        </div>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', padding: '10px 0' }}>
          <span style={{ color: 'white' }}>Language</span>
          <span style={{ color: '#888' }}>English ></span>
        </div>
      </div>

      {showSocial && (
        <div style={{
          position: 'absolute', top: 0, left: 0, right: 0, bottom: 0,
          backgroundColor: THEME.bg, zIndex: 200, display: 'flex', flexDirection: 'column'
        }}>
          <div style={{ padding: '15px', display: 'flex', alignItems: 'center', backgroundColor: THEME.surface }}>
            <div onClick={() => setShowSocial(null)} style={{ color: 'white', marginRight: '15px', cursor: 'pointer' }}>←</div>
            <h3 style={{ color: 'white', margin: 0 }}>{showSocial === 'followers' ? 'Followers' : 'Following'}</h3>
          </div>
          <div style={{ padding: '15px' }}>
             {[1, 2, 3].map(i => (
               <div key={i} style={{ display: 'flex', alignItems: 'center', marginBottom: '15px' }}>
                  <div style={{ width: 40, height: 40, borderRadius: '50%', backgroundColor: '#555', marginRight: '10px' }}></div>
                  <span style={{ color: 'white' }}>User {Math.floor(Math.random() * 1000)}</span>
               </div>
             ))}
          </div>
        </div>
      )}
    </div>
  );
};
