
import React, { useState } from 'react';
import { THEME, GAMES } from './constants';

export const GameCenter = () => {
  const [activeGame, setActiveGame] = useState<typeof GAMES[0] | null>(null);

  return (
    <div style={{ height: '100%', display: 'flex', flexDirection: 'column', padding: '20px' }}>
      <h2 style={{ color: 'white', marginBottom: '20px' }}>Game Center</h2>
      
      {activeGame ? (
        <div style={{ flex: 1, display: 'flex', flexDirection: 'column' }}>
          <div style={{ display: 'flex', alignItems: 'center', marginBottom: '10px' }}>
            <button 
              onClick={() => setActiveGame(null)}
              style={{ color: 'white', background: 'none', border: 'none', fontSize: '16px', cursor: 'pointer' }}
            >
              ← Back
            </button>
            <span style={{ color: 'white', marginLeft: '10px', fontWeight: 'bold' }}>{activeGame.name}</span>
          </div>
          <div style={{ 
            flex: 1, backgroundColor: 'white', borderRadius: '10px', 
            display: 'flex', alignItems: 'center', justifyContent: 'center' 
          }}>
            {/* Simulated Webview */}
            <div style={{ textAlign: 'center', color: '#333' }}>
              <h1>{activeGame.icon}</h1>
              <h3>Loading {activeGame.name}...</h3>
              <p>Simulating HTML5 Game Webview</p>
            </div>
          </div>
        </div>
      ) : (
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(2, 1fr)', gap: '15px' }}>
          {GAMES.map(game => (
            <div 
              key={game.id}
              onClick={() => setActiveGame(game)}
              style={{
                backgroundColor: THEME.surface, borderRadius: '15px', padding: '20px',
                display: 'flex', flexDirection: 'column', alignItems: 'center',
                cursor: 'pointer'
              }}
            >
              <div style={{ 
                width: 60, height: 60, borderRadius: '15px', backgroundColor: game.color,
                display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: '30px',
                marginBottom: '10px'
              }}>
                {game.icon}
              </div>
              <span style={{ color: 'white', fontWeight: 'bold' }}>{game.name}</span>
              <span style={{ color: '#888', fontSize: '12px' }}>Play Now</span>
            </div>
          ))}
        </div>
      )}
    </div>
  );
};
