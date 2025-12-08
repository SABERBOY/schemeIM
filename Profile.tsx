import React, { useState } from 'react';
import { User, SharedProps, Language } from './types';
import { THEME } from './constants';
import { Icon } from './Icon';

interface ProfileProps extends SharedProps {
  user: User;
  onUpdateUser: (u: User) => void;
  onSetLang: (l: Language) => void;
}

export const Profile = ({ user, onUpdateUser, lang, t, onSetLang }: ProfileProps) => {
  const [editing, setEditing] = useState(false);
  const [editName, setEditName] = useState(user.name);

  const handleSave = () => {
    onUpdateUser({ ...user, name: editName });
    setEditing(false);
  };

  return (
    <div style={{ padding: '20px', height: '100%', overflowY: 'auto' }}>
      <div style={{ display: 'flex', justifyContent: 'flex-end', marginBottom: '20px' }}>
        <div style={{ cursor: 'pointer' }} onClick={() => {}}>
           <Icon name="settings" />
        </div>
      </div>

      <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', marginBottom: '30px' }}>
        <div style={{ position: 'relative', width: 100, height: 100, marginBottom: '15px' }}>
          <img 
            src={user.avatar} 
            alt="avatar" 
            style={{ width: '100%', height: '100%', borderRadius: '50%', objectFit: 'cover', border: '2px solid #333' }} 
          />
          {user.frame && (
            <img 
              src={user.frame} 
              style={{ position: 'absolute', top: '-15%', left: '-15%', width: '130%', height: '130%', pointerEvents: 'none' }} 
            />
          )}
          {user.isVerified && (
             <div style={{ position: 'absolute', bottom: 0, right: 0, backgroundColor: 'white', borderRadius: '50%' }}>
                <Icon name="verified" size={24} color="#2196F3" />
             </div>
          )}
        </div>
        
        {editing ? (
          <div style={{ display: 'flex', gap: '10px' }}>
            <input 
              value={editName}
              onChange={(e) => setEditName(e.target.value)}
              style={{ padding: '5px', borderRadius: '5px' }}
            />
            <button onClick={handleSave} style={{ padding: '5px 10px', backgroundColor: THEME.secondary, border: 'none', borderRadius: '5px' }}>
              {t('save')}
            </button>
          </div>
        ) : (
          <div style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
            <h2 style={{ color: 'white', margin: 0 }}>{user.name}</h2>
            <div onClick={() => setEditing(true)} style={{ cursor: 'pointer', opacity: 0.7 }}>
               <span style={{ fontSize: '12px' }}>✏️</span>
            </div>
          </div>
        )}
        
        <div style={{ color: '#888', marginTop: '5px', display: 'flex', alignItems: 'center', gap: '5px' }}>
          <span>{t('id')}: {user.id}</span>
          <span style={{ cursor: 'pointer', fontSize: '12px' }}>📋</span>
        </div>
      </div>

      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '15px', marginBottom: '30px' }}>
        <div style={{ backgroundColor: THEME.surface, padding: '15px', borderRadius: '15px', display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
          <div>
            <div style={{ color: '#aaa', fontSize: '0.9rem' }}>{t('gold')}</div>
            <div style={{ color: THEME.secondary, fontSize: '1.2rem', fontWeight: 'bold' }}>{user.gold}</div>
          </div>
          <Icon name="gift" color={THEME.secondary} size={32} />
        </div>
        <div style={{ backgroundColor: THEME.surface, padding: '15px', borderRadius: '15px', display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
           <div>
            <div style={{ color: '#aaa', fontSize: '0.9rem' }}>{t('store')}</div>
            <div style={{ color: 'white', fontSize: '1.2rem', fontWeight: 'bold' }}>VIP</div>
          </div>
          <Icon name="magic" color="#E91E63" size={32} />
        </div>
      </div>

      <div style={{ backgroundColor: THEME.surface, borderRadius: '15px', overflow: 'hidden' }}>
         <div style={{ padding: '15px', borderBottom: '1px solid #333', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
            <span style={{ color: 'white' }}>{t('language')}</span>
            <div style={{ display: 'flex', gap: '10px' }}>
               <button 
                 onClick={() => onSetLang('en')}
                 style={{ 
                   background: lang === 'en' ? THEME.secondary : 'transparent', 
                   border: '1px solid #555', padding: '5px 10px', borderRadius: '5px',
                   color: lang === 'en' ? 'black' : 'white'
                 }}
               >
                 English
               </button>
               <button 
                 onClick={() => onSetLang('ar')}
                 style={{ 
                   background: lang === 'ar' ? THEME.secondary : 'transparent', 
                   border: '1px solid #555', padding: '5px 10px', borderRadius: '5px',
                   color: lang === 'ar' ? 'black' : 'white'
                 }}
               >
                 العربية
               </button>
            </div>
         </div>
         <div style={{ padding: '15px', borderBottom: '1px solid #333', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
            <span style={{ color: 'white' }}>{t('privacy')}</span>
            <span style={{ color: '#888' }}>&gt;</span>
         </div>
         <div style={{ padding: '15px', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
            <span style={{ color: '#F44336' }}>{t('logout')}</span>
         </div>
      </div>
    </div>
  );
};