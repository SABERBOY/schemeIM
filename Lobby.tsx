
import React, { useState } from 'react';
import { User, Room, SharedProps } from './types';
import { THEME } from './constants';
import { Icon } from './Icon';
import { SocialGraph } from './SocialGraph';

interface LobbyProps extends SharedProps {
  rooms: Room[];
  onJoinRoom: (r: Room) => void;
  onAddRoom: (r: Room) => void;
  currentUser: User;
}

export const Lobby = ({ rooms, onJoinRoom, onAddRoom, currentUser, lang, t }: LobbyProps) => {
  const [showCreate, setShowCreate] = useState(false);
  const [viewMode, setViewMode] = useState<'list' | 'map'>('list');
  const [newTitle, setNewTitle] = useState('');
  const [newCountry, setNewCountry] = useState('🇦🇪');
  const [newDescription, setNewDescription] = useState('');

  const handleCreate = () => {
    if (!newTitle) return;
    const newRoom: Room = {
      id: Date.now().toString(),
      title: newTitle,
      country: newCountry,
      countryFlag: newCountry,
      host: currentUser,
      users: [],
      seats: [],
      onlineCount: 1,
      tags: ['New', 'Chat']
    };
    onAddRoom(newRoom);
    setShowCreate(false);
    setNewTitle('');
    setNewDescription('');
  };

  if (viewMode === 'map') {
    return (
      <div style={{ height: '100%', position: 'relative' }}>
        <SocialGraph lang={lang} t={t} />
        <button 
          onClick={() => setViewMode('list')}
          style={{ 
            position: 'absolute', top: 20, [lang === 'ar' ? 'left' : 'right']: 20,
            backgroundColor: 'rgba(255,255,255,0.2)', color: 'white',
            border: 'none', borderRadius: '20px', padding: '8px 16px',
            cursor: 'pointer', zIndex: 10
          }}
        >
          {t('closeMap')}
        </button>
      </div>
    );
  }

  return (
    <div style={{ padding: '20px', height: '100%', overflowY: 'auto' }}>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '20px' }}>
        <h2 style={{ color: 'white', margin: 0 }}>{t('activeRooms')}</h2>
        <div style={{ display: 'flex', gap: '10px' }}>
          <button 
            onClick={() => setViewMode('map')}
            style={{ 
              backgroundColor: 'transparent', border: `1px solid ${THEME.secondary}`, borderRadius: '20px', 
              padding: '8px', display: 'flex', alignItems: 'center', cursor: 'pointer'
            }}
          >
            <Icon name="globe" color={THEME.secondary} size={16} />
          </button>
          <button 
            onClick={() => setShowCreate(true)}
            style={{ 
              backgroundColor: THEME.secondary, border: 'none', borderRadius: '20px', 
              padding: '8px 16px', fontWeight: 'bold', display: 'flex', alignItems: 'center', gap: '5px' 
            }}
          >
            <Icon name="add" color="black" size={16} /> {t('create')}
          </button>
        </div>
      </div>

      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(2, 1fr)', gap: '15px' }}>
        {rooms.map(room => (
          <div 
            key={room.id}
            onClick={() => onJoinRoom(room)}
            style={{
              backgroundColor: THEME.surface, borderRadius: '15px', overflow: 'hidden',
              cursor: 'pointer', boxShadow: '0 4px 6px rgba(0,0,0,0.3)'
            }}
          >
            <div style={{ height: '80px', backgroundColor: '#311B92', position: 'relative' }}>
              <div style={{ position: 'absolute', top: 10, [lang === 'ar' ? 'right' : 'left']: 10, fontSize: '24px' }}>{room.country}</div>
              <div style={{ position: 'absolute', bottom: 10, [lang === 'ar' ? 'left' : 'right']: 10, backgroundColor: 'rgba(0,0,0,0.5)', color: 'white', padding: '2px 8px', borderRadius: '10px', fontSize: '10px' }}>
                👥 {1 + room.users.length}
              </div>
            </div>
            <div style={{ padding: '10px', display: 'flex', gap: '10px' }}>
              <div style={{ position: 'relative', width: 40, height: 40, flexShrink: 0 }}>
                <div style={{ width: '100%', height: '100%', borderRadius: '50%', background: `url(${room.host.avatar}) center/cover`, border: '1px solid #555' }} />
                {room.host.frame && <img src={room.host.frame} style={{ position: 'absolute', top: '-15%', left: '-15%', width: '130%', height: '130%', pointerEvents: 'none' }} />}
              </div>
              <div style={{ overflow: 'hidden' }}>
                <div style={{ color: 'white', fontWeight: 'bold', marginBottom: '5px', fontSize: '0.9rem', whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis' }}>
                  <bdi>{room.title}</bdi>
                </div>
                <div style={{ display: 'flex', gap: '5px' }}>
                  {room.tags.slice(0, 1).map(tag => (
                    <span key={tag} style={{ fontSize: '10px', color: '#888', backgroundColor: 'rgba(255,255,255,0.1)', padding: '2px 6px', borderRadius: '4px' }}>{tag}</span>
                  ))}
                </div>
              </div>
            </div>
          </div>
        ))}
      </div>

      {showCreate && (
        <div style={{
          position: 'fixed', top: 0, left: 0, right: 0, bottom: 0,
          backgroundColor: 'rgba(0,0,0,0.8)', zIndex: 1000,
          display: 'flex', alignItems: 'center', justifyContent: 'center'
        }}>
          <div style={{ backgroundColor: THEME.surface, padding: '20px', borderRadius: '15px', width: '80%' }}>
            <h3 style={{ color: 'white', marginTop: 0 }}>{t('createRoom')}</h3>
            <input 
              placeholder={t('roomTitle')}
              value={newTitle}
              onChange={e => setNewTitle(e.target.value)}
              style={{ width: '100%', padding: '10px', marginBottom: '15px', borderRadius: '5px' }}
            />
            <input 
              placeholder={t('desc')}
              value={newDescription}
              onChange={e => setNewDescription(e.target.value)}
              style={{ width: '100%', padding: '10px', marginBottom: '15px', borderRadius: '5px' }}
            />
            <div style={{ display: 'flex', gap: '10px', marginBottom: '20px' }}>
              {['🇦🇪', '🇸🇦', '🇶🇦', '🇪🇬'].map(c => (
                <button 
                  key={c} 
                  onClick={() => setNewCountry(c)}
                  style={{ 
                    fontSize: '24px', padding: '5px', border: newCountry === c ? `2px solid ${THEME.secondary}` : 'none', 
                    background: 'transparent', borderRadius: '5px' 
                  }}
                >
                  {c}
                </button>
              ))}
            </div>
            <div style={{ display: 'flex', gap: '10px' }}>
              <button onClick={() => setShowCreate(false)} style={{ flex: 1, padding: '10px', borderRadius: '5px' }}>{t('cancel')}</button>
              <button onClick={handleCreate} style={{ flex: 1, padding: '10px', borderRadius: '5px', backgroundColor: THEME.secondary }}>{t('create')}</button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};
