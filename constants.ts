
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

export const TRANSLATIONS = {
  en: {
    home: 'Home',
    games: 'Games',
    studio: 'Studio',
    im: 'IM',
    me: 'Me',
    activeRooms: 'Active Rooms',
    create: 'Create',
    createRoom: 'Create Room',
    roomTitle: 'Room Title',
    desc: 'Description (Optional)',
    cancel: 'Cancel',
    saySomething: 'Say something...',
    sendGift: 'Send Gift',
    roomUsers: 'Room Users',
    host: 'Host',
    guest: 'Guest',
    settings: 'Settings',
    editProfile: 'Edit Profile',
    save: 'Save',
    gold: 'Gold',
    rank: 'Rank',
    followers: 'Followers',
    following: 'Following',
    frames: 'Avatar Frames',
    showSocial: 'Show Followers Publicly',
    language: 'Language',
    aiStudio: 'AI Studio',
    tapToUpload: 'Tap to Upload Image',
    magicProgress: 'Magic in progress...',
    promptPlaceholder: 'e.g., Add a retro filter...',
    go: 'Go',
    gameCenter: 'Game Center',
    playNow: 'Play Now',
    back: 'Back',
    loading: 'Loading',
    messages: 'Messages',
    askMe: 'Ask me anything...',
    now: 'Now',
    typeMessage: 'Type a message...',
    mapView: 'Map View',
    listView: 'List View',
    closeMap: 'Close Map',
    globalNetwork: 'Global Network',
    swipeRotate: 'Swipe to rotate • Tap nodes for info',
    connections: 'Connections',
    sharedInterest: 'Shared Interest',
  },
  ar: {
    home: 'الرئيسية',
    games: 'ألعاب',
    studio: 'ستوديو',
    im: 'رسائل',
    me: 'أنا',
    activeRooms: 'غرف نشطة',
    create: 'إنشاء',
    createRoom: 'إنشاء غرفة',
    roomTitle: 'عنوان الغرفة',
    desc: 'وصف (اختياري)',
    cancel: 'إلغاء',
    saySomething: 'قل شيئاً...',
    sendGift: 'إرسال هدية',
    roomUsers: 'المستخدمين',
    host: 'مضيف',
    guest: 'ضيف',
    settings: 'إعدادات',
    editProfile: 'تعديل الملف',
    save: 'حفظ',
    gold: 'ذهب',
    rank: 'رتبة',
    followers: 'متابعون',
    following: 'يتابع',
    frames: 'إطارات',
    showSocial: 'إظهار المتابعين للعامة',
    language: 'اللغة',
    aiStudio: 'ستوديو الذكاء الاصطناعي',
    tapToUpload: 'اضغط لرفع صورة',
    magicProgress: 'جاري السحر...',
    promptPlaceholder: 'مثلا: أضف فلتر قديم...',
    go: 'انطلق',
    gameCenter: 'مركز الألعاب',
    playNow: 'العب الآن',
    back: 'رجوع',
    loading: 'جاري التحميل',
    messages: 'الرسائل',
    askMe: 'اسألني أي شيء...',
    now: 'الآن',
    typeMessage: 'اكتب رسالة...',
    mapView: 'خريطة',
    listView: 'قائمة',
    closeMap: 'إغلاق الخريطة',
    globalNetwork: 'الشبكة العالمية',
    swipeRotate: 'اسحب للتدوير • اضغط على العقد للتفاصيل',
    connections: 'اتصالات',
    sharedInterest: 'اهتمامات مشتركة',
  }
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

export const getRank = (gold: number) => {
  if (gold < 100) return { name: 'Bronze', color: '#CD7F32' };
  if (gold < 500) return { name: 'Silver', color: '#C0C0C0' };
  if (gold < 2000) return { name: 'Gold', color: '#FFD700' };
  return { name: 'Platinum', color: '#E5E4E2' };
};

export const MOCK_CHATS: ChatContact[] = [
  { id: 'u1', name: 'Habibi User 1', avatar: '#E91E63', frame: AVATAR_FRAMES[1].image, lastMessage: 'Salam! How are you doing?', time: '12:30 PM' },
  { id: 'u2', name: 'Habibi User 2', avatar: '#2196F3', frame: AVATAR_FRAMES[2].image, lastMessage: 'Coming to the room?', time: '11:45 AM' },
  { id: 'u3', name: 'Habibi User 3', avatar: '#FF9800', lastMessage: 'Thanks for the gift!', time: 'Yesterday' },
];
