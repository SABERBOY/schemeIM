
import React, { useState, useEffect, useRef } from 'react';
import { GoogleGenAI } from "@google/genai";
import { User, ChatContact } from './types';
import { THEME, MOCK_CHATS } from './constants';
import { Icon } from './Icon';

export const UserChat = ({ user, onBack }: { user: ChatContact; onBack: () => void }) => {
  const [messages, setMessages] = useState<{id: string, text: string, sender: 'me' | 'them'}[]>([
    { id: '1', text: user.lastMessage, sender: 'them' }
  ]);
  const [input, setInput] = useState('');
  const scrollRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (scrollRef.current) {
      scrollRef.current.scrollTop = scrollRef.current.scrollHeight;
    }
  }, [messages]);

  const handleSend = () => {
    if (!input.trim()) return;
    const newMsg = { id: Date.now().toString(), text: input, sender: 'me' as const };
    setMessages(prev => [...prev, newMsg]);
    setInput('');
    
    // Simulate reply
    setTimeout(() => {
      setMessages(prev => [...prev, {
        id: (Date.now() + 1).toString(),
        text: "That sounds great! Habibi!",
        sender: 'them'
      }]);
    }, 1500);
  };

  return (
    <div style={{
      display: 'flex', flexDirection: 'column', height: '100%',
      backgroundColor: THEME.bg
    }}>
      <div style={{
        padding: '15px', display: 'flex', alignItems: 'center', gap: '15px',
        backgroundColor: THEME.surface, boxShadow: '0 2px 5px rgba(0,0,0,0.2)'
      }}>
        <div onClick={onBack} style={{ cursor: 'pointer' }}>
          <Icon name="close" />
        </div>
        <div style={{ position: 'relative', width: 40, height: 40 }}>
          <div style={{ 
            width: '100%', height: '100%', borderRadius: '50%', 
            backgroundColor: user.avatar, display: 'flex', alignItems: 'center', justifyContent: 'center'
          }}>
             {user.avatar.startsWith('#') && <span style={{ fontSize: '20px' }}>👤</span>}
          </div>
          {user.frame && <img src={user.frame} style={{ position: 'absolute', top: '-10%', left: '-10%', width: '120%', height: '120%', pointerEvents: 'none' }} />}
        </div>
        <span style={{ color: THEME.text, fontWeight: 'bold', fontSize: '1.1rem' }}>{user.name}</span>
      </div>

      <div ref={scrollRef} style={{
        flex: 1, overflowY: 'auto', padding: '15px', display: 'flex', flexDirection: 'column', gap: '10px'
      }}>
        {messages.map(msg => (
          <div key={msg.id} style={{
            alignSelf: msg.sender === 'me' ? 'flex-end' : 'flex-start',
            backgroundColor: msg.sender === 'me' ? THEME.primary : THEME.surface,
            color: THEME.text,
            padding: '10px 15px',
            borderRadius: '15px',
            maxWidth: '70%',
            fontSize: '0.95rem'
          }}>
            {msg.text}
          </div>
        ))}
      </div>

      <div style={{ padding: '10px', backgroundColor: THEME.surface, display: 'flex', gap: '10px' }}>
        <input 
          type="text" 
          value={input}
          onChange={(e) => setInput(e.target.value)}
          placeholder="Type a message..."
          style={{
            flex: 1, padding: '12px', borderRadius: '25px', border: 'none',
            backgroundColor: '#333', color: 'white', outline: 'none'
          }}
          onKeyDown={(e) => e.key === 'Enter' && handleSend()}
        />
        <button onClick={handleSend} style={{
          width: 45, height: 45, borderRadius: '50%', backgroundColor: THEME.secondary,
          border: 'none', display: 'flex', alignItems: 'center', justifyContent: 'center', cursor: 'pointer'
        }}>
          <Icon name="send" color="black" />
        </button>
      </div>
    </div>
  );
};

export const AIChat = ({ currentUser, onBack }: { currentUser: User, onBack: () => void }) => {
  const [messages, setMessages] = useState<{role: string, text: string}[]>([
    { role: 'model', text: `Salam ${currentUser.name}! I am your AI Assistant. How can I help you today?` }
  ]);
  const [input, setInput] = useState('');
  const [loading, setLoading] = useState(false);
  const scrollRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (scrollRef.current) scrollRef.current.scrollTop = scrollRef.current.scrollHeight;
  }, [messages]);

  const handleSend = async () => {
    if (!input.trim() || loading) return;
    const userMsg = input;
    setInput('');
    setMessages(prev => [...prev, { role: 'user', text: userMsg }]);
    setLoading(true);

    try {
      const ai = new GoogleGenAI({ apiKey: process.env.API_KEY || '' });
      const chat = ai.chats.create({
        model: 'gemini-3-pro-preview',
        history: messages.map(m => ({ role: m.role, parts: [{ text: m.text }] })),
      });

      const result = await chat.sendMessage({ message: userMsg });
      const text = result.text;
      
      if (text) {
        setMessages(prev => [...prev, { role: 'model', text: text }]);
      } else {
        setMessages(prev => [...prev, { role: 'model', text: "No response text." }]);
      }
    } catch (e) {
      console.error(e);
      setMessages(prev => [...prev, { role: 'model', text: "Sorry, I encountered an error. Please try again later." }]);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div style={{ display: 'flex', flexDirection: 'column', height: '100%', backgroundColor: THEME.bg }}>
      <div style={{
        padding: '15px', backgroundColor: THEME.surface, display: 'flex', alignItems: 'center', gap: '15px',
        boxShadow: '0 2px 5px rgba(0,0,0,0.2)'
      }}>
         <div onClick={onBack} style={{ cursor: 'pointer' }}>
          <Icon name="close" />
        </div>
        <div style={{
          width: 40, height: 40, borderRadius: '50%', background: 'linear-gradient(45deg, #FFD700, #FF5722)',
          display: 'flex', alignItems: 'center', justifyContent: 'center'
        }}>
          <Icon name="robot" color="white" size={20} />
        </div>
        <span style={{ color: 'white', fontWeight: 'bold' }}>AI Assistant</span>
      </div>

      <div ref={scrollRef} style={{ flex: 1, overflowY: 'auto', padding: '15px', display: 'flex', flexDirection: 'column', gap: '15px' }}>
        {messages.map((m, i) => (
          <div key={i} style={{
            alignSelf: m.role === 'user' ? 'flex-end' : 'flex-start',
            background: m.role === 'user' ? THEME.primary : THEME.surface,
            color: 'white', padding: '10px 15px', borderRadius: '15px',
            maxWidth: '80%'
          }}>
            {m.text}
          </div>
        ))}
        {loading && <div style={{ color: '#888', fontStyle: 'italic', marginLeft: '10px' }}>AI is typing...</div>}
      </div>

      <div style={{ padding: '10px', backgroundColor: THEME.surface, display: 'flex', gap: '10px' }}>
        <input 
          value={input} 
          onChange={e => setInput(e.target.value)} 
          onKeyDown={e => e.key === 'Enter' && handleSend()}
          placeholder="Ask me anything..."
          style={{
            flex: 1, padding: '12px', borderRadius: '25px', border: 'none',
            backgroundColor: '#333', color: 'white', outline: 'none'
          }}
        />
        <button onClick={handleSend} style={{
          width: 45, height: 45, borderRadius: '50%', backgroundColor: THEME.secondary, border: 'none',
          display: 'flex', alignItems: 'center', justifyContent: 'center'
        }}>
          <Icon name="send" color="black" />
        </button>
      </div>
    </div>
  );
};

export const Messages = ({ currentUser, onNavigate }: { currentUser: User, onNavigate: (route: string) => void }) => {
  const [selectedUser, setSelectedUser] = useState<ChatContact | null>(null);
  const [isAiChat, setIsAiChat] = useState(false);

  if (isAiChat) {
    return <AIChat currentUser={currentUser} onBack={() => setIsAiChat(false)} />;
  }

  if (selectedUser) {
    return <UserChat user={selectedUser} onBack={() => setSelectedUser(null)} />;
  }

  return (
    <div style={{ height: '100%', padding: '15px', overflowY: 'auto' }}>
      
      {/* RongCloud Status Banner */}
      <div style={{
        backgroundColor: '#2A2A3A',
        padding: '12px',
        borderRadius: '8px',
        display: 'flex',
        alignItems: 'center',
        marginBottom: '20px',
        borderLeft: '4px solid #2196F3'
      }}>
        <div style={{ width: 8, height: 8, borderRadius: '50%', backgroundColor: '#2196F3', marginRight: '10px' }}></div>
        <span style={{ color: '#AAA', fontSize: '0.9rem' }}>RongCloud IM Connected</span>
      </div>

      <h2 style={{ color: 'white', marginBottom: '15px' }}>Messages</h2>

      {/* AI Assistant Row */}
      <div 
        onClick={() => setIsAiChat(true)}
        style={{
          display: 'flex', alignItems: 'center', padding: '15px',
          backgroundColor: THEME.surface, borderRadius: '12px', marginBottom: '15px',
          cursor: 'pointer'
        }}
      >
        <div style={{
          width: 50, height: 50, borderRadius: '50%',
          background: 'linear-gradient(135deg, #6200EA, #B388FF)',
          display: 'flex', alignItems: 'center', justifyContent: 'center',
          marginRight: '15px'
        }}>
          <Icon name="robot" size={28} />
        </div>
        <div style={{ flex: 1 }}>
          <div style={{ color: THEME.secondary, fontWeight: 'bold', marginBottom: '4px' }}>AI Assistant</div>
          <div style={{ color: '#888', fontSize: '0.9rem' }}>Ask me anything...</div>
        </div>
        <span style={{ color: '#666', fontSize: '0.8rem' }}>Now</span>
      </div>

      {/* Mock User Chats */}
      <div style={{ border: '1px solid #333', borderRadius: '12px', overflow: 'hidden' }}>
        {MOCK_CHATS.map((chat, idx) => (
          <div 
            key={chat.id}
            onClick={() => setSelectedUser(chat)}
            style={{
              display: 'flex', alignItems: 'center', padding: '15px',
              backgroundColor: THEME.surface,
              borderBottom: idx < MOCK_CHATS.length - 1 ? '1px solid #333' : 'none',
              cursor: 'pointer'
            }}
          >
            <div style={{
              width: 50, height: 50, borderRadius: '50%',
              backgroundColor: '#333',
              marginRight: '15px',
              position: 'relative'
            }}>
              {/* Avatar placeholder color */}
              <div style={{ width: '100%', height: '100%', borderRadius: '50%', opacity: 0.8, backgroundColor: chat.avatar }}></div>
              {chat.frame && <img src={chat.frame} style={{ position: 'absolute', top: '-10%', left: '-10%', width: '120%', height: '120%', pointerEvents: 'none' }} />}
            </div>
            <div style={{ flex: 1 }}>
              <div style={{ color: 'white', fontWeight: 'bold', marginBottom: '4px' }}>{chat.name}</div>
              <div style={{ color: '#888', fontSize: '0.9rem', whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis', maxWidth: '180px' }}>
                {chat.lastMessage}
              </div>
            </div>
            <span style={{ color: '#666', fontSize: '0.8rem' }}>{chat.time}</span>
          </div>
        ))}
      </div>
    </div>
  );
};
