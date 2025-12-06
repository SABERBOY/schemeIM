
import React, { useState, useEffect } from 'react';
import { createRoot } from 'react-dom/client';
import { User, Room, Language } from './types';
import { THEME, AVATAR_FRAMES, TRANSLATIONS } from './constants';
import { Icon } from './Icon';
import { Messages } from './Chat';
import { VoiceRoom } from './VoiceRoom';
import { GameCenter } from './GameCenter';
import { Profile } from './Profile';
import { Lobby } from './Lobby';
import { ImageStudio } from './ImageStudio';
import { Login } from './Login';

const App = () => {
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [tab, setTab] = useState<'home' | 'games' | 'studio' | 'im' | 'me'>('home');
  const [activeRoom, setActiveRoom] = useState<Room | null>(null);
  const [lang, setLang] = useState<Language>('en');
  
  // Lifted State
  const [currentUser, setCurrentUser] = useState<User>({
    id: 'user_123',
    name: 'Habibi King',
    avatar: 'https://cdn-icons-png.flaticon.com/512/147/147142.png',
    frame: AVATAR_FRAMES[1].image, // Default Gold Luxury Frame
    gold: 500,
    privacy: { showSocialList: true },
    isVerified: true
  });

  const [rooms, setRooms] = useState<Room[]>([
    { id: '1', title: 'Dubai Chill 🌴', country: '🇦🇪', host: { id: 'h1', name: 'Ahmed', avatar: 'https://cdn-icons-png.flaticon.com/512/4825/4825038.png', frame: AVATAR_FRAMES[3].image, gold: 0 }, users: [], tags: ['Music', 'Chat'] },
    { id: '2', title: 'Riyadh Nights 🌙', country: '🇸🇦', host: { id: 'h2', name: 'Sarah', avatar: 'https://cdn-icons-png.flaticon.com/512/4825/4825112.png', gold: 0 }, users: [], tags: ['Poetry'] },
    { id: '3', title: 'Cairo Vibes 🇪🇬', country: '🇪🇬', host: { id: 'h3', name: 'Omar', avatar: 'https://cdn-icons-png.flaticon.com/512/4825/4825044.png', frame: AVATAR_FRAMES[2].image, gold: 0 }, users: [], tags: ['Funny'] },
  ]);

  // Translation Helper
  const t = (key: keyof typeof TRANSLATIONS['en']) => {
    return TRANSLATIONS[lang][key] || key;
  };

  const handleSetLang = (l: Language) => {
    setLang(l);
  }

  const handleLogin = (userUpdates: Partial<User>) => {
    setCurrentUser(prev => ({ ...prev, ...userUpdates }));
    setIsLoggedIn(true);
  };
  
  const handleLogout = () => {
    setIsLoggedIn(false);
    setActiveRoom(null);
    setTab('home');
  };

  // If not logged in, show Login Screen
  if (!isLoggedIn) {
    return <Login onLogin={handleLogin} lang={lang} t={t} onSetLang={handleSetLang} />;
  }

  if (activeRoom) {
    return <VoiceRoom 
      room={activeRoom} 
      user={currentUser} 
      onLeave={() => setActiveRoom(null)} 
      onUpdateUser={setCurrentUser}
      lang={lang}
      t={t}
    />;
  }

  return (
    <div 
      dir={lang === 'ar' ? 'rtl' : 'ltr'}
      style={{ 
        height: '100vh', width: '100vw', backgroundColor: THEME.bg, 
        display: 'flex', flexDirection: 'column',
        fontFamily: lang === 'ar' ? "'Cairo', sans-serif" : "'Noto Sans Arabic', sans-serif"
      }}>
      <div style={{ flex: 1, overflow: 'hidden' }}>
        {tab === 'home' && (
          <Lobby 
            rooms={rooms} 
            onJoinRoom={setActiveRoom} 
            onAddRoom={(r) => setRooms([r, ...rooms])}
            currentUser={currentUser}
            lang={lang}
            t={t}
          />
        )}
        {tab === 'games' && <GameCenter lang={lang} t={t} />}
        {tab === 'studio' && <ImageStudio lang={lang} t={t} />}
        {tab === 'im' && <Messages currentUser={currentUser} onNavigate={() => {}} lang={lang} t={t} />}
        {tab === 'me' && <Profile user={currentUser} onUpdateUser={setCurrentUser} lang={lang} t={t} onSetLang={handleSetLang} />}
      </div>

      {/* Bottom Navigation */}
      <div style={{
        height: '60px', backgroundColor: THEME.surface, display: 'flex',
        justifyContent: 'space-around', alignItems: 'center',
        borderTop: '1px solid #333'
      }}>
        <div onClick={() => setTab('home')} style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', opacity: tab === 'home' ? 1 : 0.5, cursor: 'pointer' }}>
          <Icon name="home" color={tab === 'home' ? THEME.secondary : 'white'} />
          <span style={{ fontSize: '10px', color: 'white', marginTop: '4px' }}>{t('home')}</span>
        </div>
        <div onClick={() => setTab('games')} style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', opacity: tab === 'games' ? 1 : 0.5, cursor: 'pointer' }}>
          <Icon name="games" color={tab === 'games' ? THEME.secondary : 'white'} />
          <span style={{ fontSize: '10px', color: 'white', marginTop: '4px' }}>{t('games')}</span>
        </div>
        <div onClick={() => setTab('studio')} style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', opacity: tab === 'studio' ? 1 : 0.5, cursor: 'pointer' }}>
          <Icon name="magic" color={tab === 'studio' ? THEME.secondary : 'white'} />
          <span style={{ fontSize: '10px', color: 'white', marginTop: '4px' }}>{t('studio')}</span>
        </div>
        <div onClick={() => setTab('im')} style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', opacity: tab === 'im' ? 1 : 0.5, cursor: 'pointer' }}>
          <Icon name="im" color={tab === 'im' ? THEME.secondary : 'white'} />
          <span style={{ fontSize: '10px', color: 'white', marginTop: '4px' }}>{t('im')}</span>
        </div>
        <div onClick={() => setTab('me')} style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', opacity: tab === 'me' ? 1 : 0.5, cursor: 'pointer' }}>
          <Icon name="me" color={tab === 'me' ? THEME.secondary : 'white'} />
          <span style={{ fontSize: '10px', color: 'white', marginTop: '4px' }}>{t('me')}</span>
        </div>
      </div>
    </div>
  );
};

const root = createRoot(document.getElementById('root')!);
root.render(<App />);
