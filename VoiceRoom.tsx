
import React, { useState, useEffect, useRef } from 'react';
import { User, Room, Message, SharedProps } from './types';
import { THEME, GIFTS, QUICK_REPLIES, REACTIONS, getRank } from './constants';
import { Icon } from './Icon';

interface VoiceRoomProps extends SharedProps {
  room: Room;
  user: User;
  onLeave: () => void;
  onUpdateUser: (u: User) => void;
}

export const VoiceRoom = ({ room, user, onLeave, onUpdateUser, lang, t }: VoiceRoomProps) => {
  const [micOn, setMicOn] = useState(false);
  const [messages, setMessages] = useState<Message[]>([]);
  const [inputText, setInputText] = useState('');
  const [showGifts, setShowGifts] = useState(false);
  const [showQuickReplies, setShowQuickReplies] = useState(false);
  const [giftAnimation, setGiftAnimation] = useState<{name: string, icon: string} | null>(null);
  const [showReactionPicker, setShowReactionPicker] = useState<string | null>(null); // message ID
  const [showSettings, setShowSettings] = useState(false);
  const [showUserList, setShowUserList] = useState(false);
  const [textSize, setTextSize] = useState<'normal'|'large'|'xl'>('normal');
  const [highContrast, setHighContrast] = useState(false);
  const chatEndRef = useRef<HTMLDivElement>(null);
  
  // Audio effect for gifts
  const playGiftSound = () => {
    const audio = new Audio('https://assets.mixkit.co/sfx/preview/mixkit-magical-coin-win-1936.mp3');
    audio.volume = 0.5;
    audio.play().catch(e => console.log('Audio play failed', e));
  };

  useEffect(() => {
    chatEndRef.current?.scrollIntoView({ behavior: 'smooth' });
  }, [messages]);

  const sendMessage = (text: string) => {
    if (!text.trim()) return;
    const newMsg: Message = {
      id: Date.now().toString(),
      userId: user.id,
      userName: user.name,
      content: text,
      type: 'text'
    };
    setMessages([...messages, newMsg]);
    setInputText('');
    setShowQuickReplies(false);
  };

  const sendGift = (gift: typeof GIFTS[0]) => {
    if (user.gold < gift.cost) {
      alert("Not enough gold!");
      return;
    }
    
    // Update local user gold
    onUpdateUser({ ...user, gold: user.gold - gift.cost });
    
    // Play sound
    playGiftSound();

    // Show animation
    setGiftAnimation({ name: gift.name, icon: gift.icon });
    setTimeout(() => setGiftAnimation(null), 3000);
    
    // Send message
    const newMsg: Message = {
      id: Date.now().toString(),
      userId: user.id,
      userName: user.name,
      content: `Sent a ${gift.name}`,
      type: 'gift',
      giftName: gift.name,
      giftIcon: gift.icon
    };
    setMessages([...messages, newMsg]);
    setShowGifts(false);
  };

  const addReaction = (msgId: string, reaction: string) => {
    setMessages(prev => prev.map(msg => {
      if (msg.id !== msgId) return msg;
      const current = msg.reactions || {};
      return {
        ...msg,
        reactions: { ...current, [reaction]: (current[reaction] || 0) + 1 }
      };
    }));
    setShowReactionPicker(null);
  };

  // Styles based on settings
  const chatFontSize = textSize === 'large' ? '1.1rem' : textSize === 'xl' ? '1.3rem' : '0.9rem';
  const chatBg = highContrast ? '#000000' : 'rgba(0,0,0,0.5)';
  const chatText = highContrast ? '#FFFF00' : 'white';

  const hostRank = getRank(room.host.gold);
  const userRank = getRank(user.gold);

  return (
    <div style={{
      height: '100%', display: 'flex', flexDirection: 'column',
      background: 'linear-gradient(180deg, #311B92 0%, #121212 100%)',
      position: 'relative', overflow: 'hidden'
    }}>
      {/* Header */}
      <div style={{
        padding: '15px', display: 'flex', justifyContent: 'space-between', alignItems: 'center',
        background: 'rgba(0,0,0,0.2)'
      }}>
        {/* Flip close icon in RTL usually, but X is universal. Direction might change */}
        <div style={{ color: 'white' }} onClick={onLeave}>
          <Icon name="close" />
        </div>
        <div style={{ color: 'white', fontWeight: 'bold' }}>
          {room.country} <bdi>{room.title}</bdi>
        </div>
        <div style={{ display: 'flex', gap: '15px', alignItems: 'center' }}>
          <div style={{ color: 'white', cursor: 'pointer' }} onClick={() => setShowUserList(!showUserList)}>
            <Icon name="people" />
          </div>
          <div style={{ color: 'white', position: 'relative', cursor: 'pointer' }} onClick={() => setShowSettings(!showSettings)}>
            <Icon name="settings" />
            {showSettings && (
              <div style={{
                position: 'absolute', top: '30px', [lang === 'ar' ? 'left' : 'right']: 0, width: '200px',
                backgroundColor: THEME.surface, padding: '10px', borderRadius: '8px', zIndex: 100,
                boxShadow: '0 4px 10px rgba(0,0,0,0.5)'
              }}>
                <div style={{ marginBottom: '10px', fontSize: '0.9rem' }}>Text Size</div>
                <div style={{ display: 'flex', gap: '5px', marginBottom: '15px' }}>
                  <button onClick={() => setTextSize('normal')} style={{ flex: 1, padding: '5px' }}>A</button>
                  <button onClick={() => setTextSize('large')} style={{ flex: 1, padding: '5px' }}>A+</button>
                  <button onClick={() => setTextSize('xl')} style={{ flex: 1, padding: '5px' }}>A++</button>
                </div>
                <div style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
                  <input type="checkbox" checked={highContrast} onChange={e => setHighContrast(e.target.checked)} />
                  <span style={{ fontSize: '0.9rem' }}>High Contrast</span>
                </div>
              </div>
            )}
          </div>
        </div>
      </div>

      {/* Seats Grid */}
      <div style={{ padding: '20px', display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: '15px' }}>
        {/* Host Seat */}
        <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
          <div style={{ position: 'relative', width: 60, height: 60 }}>
            <div style={{
              width: '100%', height: '100%', borderRadius: '50%', border: `2px solid ${THEME.secondary}`,
              background: `url(${room.host.avatar}) center/cover`,
              boxSizing: 'border-box'
            }}></div>
             {/* Host Frame */}
            {room.host.frame && (
              <img 
                src={room.host.frame} 
                style={{ position: 'absolute', top: '-15%', left: '-15%', width: '130%', height: '130%', pointerEvents: 'none' }} 
              />
            )}
            <div style={{
              position: 'absolute', bottom: -5, right: -5,
              backgroundColor: THEME.secondary, borderRadius: '50%', padding: 2, fontSize: '10px'
            }}>👑</div>
          </div>
          <div style={{ marginTop: 5, textAlign: 'center' }}>
            <span style={{ color: 'white', fontSize: '12px', display: 'block' }}><bdi>{room.host.name}</bdi></span>
            <span style={{ color: hostRank.color, fontSize: '10px', border: `1px solid ${hostRank.color}`, borderRadius: '4px', padding: '0 3px' }}>{hostRank.name}</span>
          </div>
        </div>
        
        {/* Guest Seats (1-8) */}
        {[...Array(8)].map((_, i) => (
          <div key={i} style={{ display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
             <div style={{
              width: 55, height: 55, borderRadius: '50%', border: '1px solid rgba(255,255,255,0.3)',
              backgroundColor: 'rgba(0,0,0,0.3)', display: 'flex', alignItems: 'center', justifyContent: 'center'
            }}>
              <Icon name="micOff" size={16} color="rgba(255,255,255,0.5)" />
            </div>
             <span style={{ color: 'rgba(255,255,255,0.5)', fontSize: '12px', marginTop: 5 }}>{i+1}</span>
          </div>
        ))}
      </div>

      {/* User List Sidebar */}
      {showUserList && (
        <>
          <div 
            onClick={() => setShowUserList(false)}
            style={{
              position: 'absolute', top: 0, left: 0, right: 0, bottom: 0,
              backgroundColor: 'rgba(0,0,0,0.5)', zIndex: 110
            }}
          />
          <div style={{
            position: 'absolute', top: 0, [lang === 'ar' ? 'left' : 'right']: 0, bottom: 0, width: '70%',
            backgroundColor: THEME.surface, zIndex: 120, padding: '20px',
            boxShadow: lang === 'ar' ? '4px 0 10px rgba(0,0,0,0.5)' : '-4px 0 10px rgba(0,0,0,0.5)', overflowY: 'auto',
            animation: 'slideIn 0.3s ease-out'
          }}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '20px' }}>
              <h3 style={{ color: 'white', margin: 0 }}>{t('roomUsers')}</h3>
              <div onClick={() => setShowUserList(false)} style={{ color: 'white', cursor: 'pointer' }}>
                <Icon name="close" />
              </div>
            </div>
            
            <div style={{ display: 'flex', flexDirection: 'column', gap: '15px' }}>
              {/* Host */}
              <div style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
                <div style={{ position: 'relative', width: 40, height: 40 }}>
                  <div style={{ width: '100%', height: '100%', borderRadius: '50%', background: `url(${room.host.avatar}) center/cover`, border: `2px solid ${THEME.secondary}` }} />
                  {room.host.frame && <img src={room.host.frame} style={{ position: 'absolute', top: '-15%', left: '-15%', width: '130%', height: '130%', pointerEvents: 'none' }} />}
                </div>
                <div>
                  <div style={{ display: 'flex', alignItems: 'center', gap: '5px' }}>
                    <div style={{ color: THEME.secondary, fontWeight: 'bold' }}><bdi>{room.host.name}</bdi></div>
                    <span style={{ color: hostRank.color, fontSize: '9px', border: `1px solid ${hostRank.color}`, borderRadius: '4px', padding: '0 3px' }}>{hostRank.name}</span>
                  </div>
                  <div style={{ color: '#888', fontSize: '0.8rem' }}>{t('host')} • 👑 Owner</div>
                </div>
              </div>

              {/* Current User */}
              <div style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
                <div style={{ position: 'relative', width: 40, height: 40 }}>
                  <div style={{ width: '100%', height: '100%', borderRadius: '50%', background: `url(${user.avatar}) center/cover` }} />
                  {user.frame && <img src={user.frame} style={{ position: 'absolute', top: '-15%', left: '-15%', width: '130%', height: '130%', pointerEvents: 'none' }} />}
                </div>
                <div>
                  <div style={{ display: 'flex', alignItems: 'center', gap: '5px' }}>
                    <div style={{ color: 'white' }}><bdi>{user.name}</bdi> (You)</div>
                    <span style={{ color: userRank.color, fontSize: '9px', border: `1px solid ${userRank.color}`, borderRadius: '4px', padding: '0 3px' }}>{userRank.name}</span>
                  </div>
                  <div style={{ color: '#888', fontSize: '0.8rem' }}>{t('guest')} • Lv. 5</div>
                </div>
              </div>

              {/* Mock Users */}
              {room.users.length === 0 && [1,2,3,4,5].map(i => (
                <div key={i} style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
                   <div style={{ width: 40, height: 40, borderRadius: '50%', backgroundColor: '#555' }} />
                   <div>
                    <div style={{ color: 'white' }}>Habibi Guest {i}</div>
                    <div style={{ color: '#888', fontSize: '0.8rem' }}>{t('guest')}</div>
                   </div>
                </div>
              ))}

              {room.users.map(u => {
                const uRank = getRank(u.gold);
                return (
                  <div key={u.id} style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
                    <div style={{ position: 'relative', width: 40, height: 40 }}>
                      <div style={{ width: '100%', height: '100%', borderRadius: '50%', background: `url(${u.avatar}) center/cover` }} />
                      {u.frame && <img src={u.frame} style={{ position: 'absolute', top: '-15%', left: '-15%', width: '130%', height: '130%', pointerEvents: 'none' }} />}
                    </div>
                    <div>
                      <div style={{ display: 'flex', alignItems: 'center', gap: '5px' }}>
                        <div style={{ color: 'white' }}><bdi>{u.name}</bdi></div>
                        <span style={{ color: uRank.color, fontSize: '9px', border: `1px solid ${uRank.color}`, borderRadius: '4px', padding: '0 3px' }}>{uRank.name}</span>
                      </div>
                      <div style={{ color: '#888', fontSize: '0.8rem' }}>{t('guest')}</div>
                    </div>
                  </div>
                );
              })}
            </div>
          </div>
        </>
      )}

      {/* Gift Animation Overlay */}
      {giftAnimation && (
        <div style={{
          position: 'absolute', top: '50%', left: '50%', transform: 'translate(-50%, -50%)',
          zIndex: 50, animation: 'popIn 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275)'
        }}>
          <div style={{ fontSize: '80px' }}>{giftAnimation.icon}</div>
          <div style={{ 
            color: THEME.secondary, fontWeight: 'bold', fontSize: '24px', 
            textShadow: '0 2px 4px rgba(0,0,0,0.5)', textAlign: 'center' 
          }}>{giftAnimation.name}</div>
        </div>
      )}

      {/* Chat Area */}
      <div style={{ flex: 1, overflowY: 'auto', padding: '15px', display: 'flex', flexDirection: 'column', gap: '8px' }}>
        {messages.map((msg) => (
          <div key={msg.id} style={{ display: 'flex', flexDirection: 'column', alignItems: 'flex-start' }}>
            <div style={{
              backgroundColor: msg.type === 'gift' ? 'rgba(255, 215, 0, 0.2)' : chatBg,
              border: msg.type === 'gift' ? `1px solid ${THEME.secondary}` : 'none',
              padding: '8px 12px', borderRadius: '12px',
              maxWidth: '80%', position: 'relative'
            }}>
              {/* BDI Tag isolates user names from RTL text context to prevent 123 User flip */}
              <span style={{ color: THEME.secondary, fontWeight: 'bold', fontSize: '0.8rem', marginRight: '5px', marginLeft: '5px' }}>
                <bdi>{msg.userName}</bdi>:
              </span>
              <span style={{ color: msg.type === 'gift' ? THEME.secondary : chatText, fontSize: chatFontSize }}>
                <bdi>{msg.content}</bdi> {msg.giftIcon}
              </span>

              {/* Reaction Button */}
              <div 
                onClick={() => setShowReactionPicker(showReactionPicker === msg.id ? null : msg.id)}
                style={{ position: 'absolute', [lang === 'ar' ? 'left' : 'right']: -25, top: 0, cursor: 'pointer', opacity: 0.6 }}
              >
                <span style={{ fontSize: '14px' }}>😊</span>
              </div>

              {/* Reaction Picker */}
              {showReactionPicker === msg.id && (
                <div style={{
                  position: 'absolute', top: -35, [lang === 'ar' ? 'right' : 'left']: 0, backgroundColor: THEME.surface,
                  borderRadius: '15px', padding: '5px', display: 'flex', gap: '5px', zIndex: 10
                }}>
                  {REACTIONS.map(r => (
                    <span key={r} onClick={() => addReaction(msg.id, r)} style={{ cursor: 'pointer', fontSize: '16px' }}>{r}</span>
                  ))}
                </div>
              )}
            </div>
            
            {/* Display Reactions */}
            {msg.reactions && Object.keys(msg.reactions).length > 0 && (
              <div style={{ display: 'flex', gap: '4px', marginInlineStart: '5px', marginTop: '2px' }}>
                {Object.entries(msg.reactions).map(([r, count]) => (
                  <span key={r} style={{ fontSize: '10px', backgroundColor: 'rgba(255,255,255,0.1)', padding: '2px 4px', borderRadius: '8px', color: 'white' }}>
                    {r} {count}
                  </span>
                ))}
              </div>
            )}
          </div>
        ))}
        <div ref={chatEndRef} />
      </div>

      {/* Quick Replies Overlay */}
      {showQuickReplies && (
        <div style={{ 
          position: 'absolute', bottom: '70px', left: 0, right: 0, 
          padding: '10px', backgroundColor: 'rgba(0,0,0,0.85)', 
          display: 'flex', overflowX: 'auto', gap: '8px', zIndex: 90,
          borderTop: '1px solid #333'
        }}>
          {QUICK_REPLIES.map((reply, i) => (
            <div 
              key={i}
              onClick={() => sendMessage(reply)}
              style={{
                backgroundColor: 'rgba(255,255,255,0.15)', color: 'white', padding: '8px 16px',
                borderRadius: '20px', fontSize: '0.9rem', whiteSpace: 'nowrap', cursor: 'pointer',
                border: '1px solid rgba(255,255,255,0.2)'
              }}
            >
              {reply}
            </div>
          ))}
        </div>
      )}

      {/* Footer / Controls */}
      <div style={{ padding: '10px', backgroundColor: '#1E1E1E' }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
          <button 
            onClick={() => setMicOn(!micOn)}
            style={{
              width: 40, height: 40, borderRadius: '50%', border: 'none',
              backgroundColor: micOn ? THEME.success : 'rgba(255,255,255,0.1)',
              display: 'flex', alignItems: 'center', justifyContent: 'center'
            }}
          >
            <Icon name={micOn ? "micOn" : "micOff"} />
          </button>
          
          <div style={{ flex: 1, backgroundColor: 'rgba(255,255,255,0.1)', borderRadius: '20px', display: 'flex', alignItems: 'center', padding: '0 10px' }}>
            <input 
              type="text" 
              value={inputText}
              onChange={(e) => setInputText(e.target.value)}
              placeholder={t('saySomething')}
              style={{
                flex: 1, padding: '10px', border: 'none', background: 'transparent',
                color: 'white', outline: 'none'
              }}
              onKeyDown={(e) => e.key === 'Enter' && sendMessage(inputText)}
            />
            {/* Quick Reply Toggle */}
            <div 
              onClick={() => setShowQuickReplies(!showQuickReplies)} 
              style={{
                padding: '5px', cursor: 'pointer', 
                opacity: showQuickReplies ? 1 : 0.6
              }}
            >
              <Icon name="lightning" color={showQuickReplies ? THEME.secondary : 'white'} size={20} />
            </div>
          </div>

          {/* Quick Gift (Rose) */}
          <button
             onClick={() => sendGift(GIFTS[0])}
             style={{
               width: 40, height: 40, borderRadius: '50%', border: 'none',
               backgroundColor: '#FFEBEE', display: 'flex', alignItems: 'center', justifyContent: 'center'
             }}
          >
            <span style={{ fontSize: '20px' }}>🌹</span>
          </button>

          <button
            onClick={() => setShowGifts(!showGifts)} 
            style={{
              width: 40, height: 40, borderRadius: '50%', border: 'none',
              backgroundColor: THEME.secondary, display: 'flex', alignItems: 'center', justifyContent: 'center'
            }}
          >
            <Icon name="gift" color="black" />
          </button>
        </div>
      </div>

      {/* Gift Panel */}
      {showGifts && (
        <div style={{
          position: 'absolute', bottom: 0, left: 0, right: 0,
          backgroundColor: THEME.surface, borderTopLeftRadius: '20px', borderTopRightRadius: '20px',
          padding: '20px', zIndex: 100
        }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: '15px', color: 'white' }}>
            <span>{t('sendGift')}</span>
            <span style={{ color: THEME.secondary }}>💰 {user.gold}</span>
          </div>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: '15px' }}>
            {GIFTS.map(gift => (
              <div 
                key={gift.id} 
                onClick={() => sendGift(gift)}
                style={{
                  display: 'flex', flexDirection: 'column', alignItems: 'center',
                  padding: '10px', borderRadius: '10px', backgroundColor: 'rgba(255,255,255,0.05)'
                }}
              >
                <div style={{ fontSize: '30px', marginBottom: '5px' }}>{gift.icon}</div>
                <div style={{ fontSize: '10px', color: 'white' }}>{gift.name}</div>
                <div style={{ fontSize: '10px', color: THEME.secondary }}>{gift.cost}</div>
              </div>
            ))}
          </div>
          <button 
            onClick={() => setShowGifts(false)}
            style={{
              width: '100%', marginTop: '20px', padding: '12px', borderRadius: '10px',
              border: 'none', backgroundColor: 'rgba(255,255,255,0.1)', color: 'white'
            }}
          >
            {t('cancel')}
          </button>
        </div>
      )}
    </div>
  );
};
