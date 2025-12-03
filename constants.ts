
import { ChatContact } from './types';

export const THEME = {
  primary: '#7B1FA2', // Deep Purple
  secondary: '#FFD700', // Gold
  bg: '#121212',
  surface: '#1E1E1E',
  text: '#FFFFFF',
  textSecondary: '#B0B0B0',
  danger: '#D32F2F',
  success: '#388E3C'
};

export const GIFTS = [
  { id: 'rose', name: 'Rose', icon: '🌹', cost: 1 },
  { id: 'tea', name: 'Mint Tea', icon: '🍵', cost: 10 },
  { id: 'perfume', name: 'Oud', icon: '⚱️', cost: 50 },
  { id: 'camel', name: 'Camel', icon: '🐪', cost: 100 },
  { id: 'palace', name: 'Palace', icon: '🕌', cost: 1000 },
];

export const AVATAR_FRAMES = [
  { id: 'none', name: 'Default', image: '' },
  { id: 'gold_luxury', name: 'Gold Luxury', image: `data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><defs><linearGradient id='g' x1='0' y1='0' x2='1' y2='1'><stop offset='0%' stop-color='%23FFD700'/><stop offset='50%' stop-color='%23FFA500'/><stop offset='100%' stop-color='%23FFD700'/></linearGradient></defs><circle cx='50' cy='50' r='46' fill='none' stroke='url(%23g)' stroke-width='6'/><circle cx='50' cy='50' r='46' fill='none' stroke='white' stroke-width='1' stroke-dasharray='2 5'/></svg>` },
  { id: 'neon_blue', name: 'Neon Blue', image: `data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><circle cx='50' cy='50' r='47' fill='none' stroke='%2300FFFF' stroke-width='4' filter='drop-shadow(0 0 5px %2300FFFF)'/></svg>` },
  { id: 'royal_purple', name: 'Royal', image: `data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><circle cx='50' cy='50' r='46' fill='none' stroke='%239C27B0' stroke-width='6'/><circle cx='50' cy='0' r='5' fill='%23FFD700'/><circle cx='50' cy='100' r='5' fill='%23FFD700'/></svg>` },
  { id: 'rose_garden', name: 'Rose Garden', image: `data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><circle cx='50' cy='50' r='46' fill='none' stroke='%23E91E63' stroke-width='4'/><circle cx='15' cy='50' r='8' fill='%23E91E63'/><circle cx='85' cy='50' r='8' fill='%23E91E63'/></svg>` },
];

export const GAMES = [
  { id: 'ludo', name: 'Ludo Star', icon: '🎲', color: '#E91E63' },
  { id: 'domino', name: 'Domino Pro', icon: '🀄', color: '#2196F3' },
  { id: 'carrom', name: 'Carrom Disc', icon: '⚪', color: '#FF9800' },
  { id: 'uno', name: 'Uno Classic', icon: '🃏', color: '#4CAF50' },
];

export const QUICK_REPLIES = [
  "Hello! 👋",
  "Nice to meet you! 🤝",
  "Salam! 👋",
  "Mashallah ✨",
  "Habibi! ❤️",
  "Yalla! 🚀",
  "Shukran 🙏",
  "Welcome 🌹",
  "Nice voice 🎤",
  "Gift me? 🎁"
];

export const REACTIONS = ['❤️', '😂', '👍', '🔥', '😮', '😢'];

export const MOCK_CHATS: ChatContact[] = [
  { id: 'u1', name: 'Habibi User 1', avatar: '#E91E63', frame: AVATAR_FRAMES[1].image, lastMessage: 'Salam! How are you doing?', time: '12:30 PM' },
  { id: 'u2', name: 'Habibi User 2', avatar: '#2196F3', frame: AVATAR_FRAMES[2].image, lastMessage: 'Coming to the room?', time: '11:45 AM' },
  { id: 'u3', name: 'Habibi User 3', avatar: '#FF9800', lastMessage: 'Thanks for the gift!', time: 'Yesterday' },
];
