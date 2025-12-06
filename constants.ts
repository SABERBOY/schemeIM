export const THEME = {
  bg: '#121212',
  surface: '#1E1E1E',
  primary: '#311B92',
  secondary: '#FFD700',
  text: '#FFFFFF',
  success: '#4CAF50',
};

export const AVATAR_FRAMES = [
  { id: '1', image: '', name: 'None' },
  { id: '2', image: 'https://cdn-icons-png.flaticon.com/512/4315/4315445.png', name: 'Gold' },
  { id: '3', image: 'https://cdn-icons-png.flaticon.com/512/4315/4315457.png', name: 'Platinum' },
  { id: '4', image: 'https://cdn-icons-png.flaticon.com/512/4315/4315467.png', name: 'Diamond' },
];

export const TRANSLATIONS = {
  en: {
    home: 'Home',
    games: 'Games',
    studio: 'Studio',
    im: 'IM',
    me: 'Me',
    activeRooms: 'Active Rooms',
    create: 'Create',
    roomTitle: 'Room Title',
    desc: 'Description',
    cancel: 'Cancel',
    createRoom: 'Create Room',
    gameCenter: 'Game Center',
    back: 'Back',
    loading: 'Loading',
    playNow: 'Play Now',
    aiStudio: 'AI Image Studio',
    tapToUpload: 'Tap to upload image',
    magicProgress: 'Performing Magic...',
    promptPlaceholder: 'Describe changes...',
    go: 'Go',
    messages: 'Messages',
    askMe: 'Ask me anything...',
    now: 'Now',
    saySomething: 'Say something...',
    sendGift: 'Send Gift',
    roomUsers: 'Room Users',
    host: 'Host',
    guest: 'Guest',
    globalNetwork: 'Global Network',
    swipeRotate: 'Swipe to rotate',
    connections: 'Connections',
    sharedInterest: 'Shared Interest',
    closeMap: 'Close Map',
    profile: 'Profile',
    editProfile: 'Edit Profile',
    wallet: 'Wallet',
    store: 'Store',
    settings: 'Settings',
    language: 'Language',
    privacy: 'Privacy',
    save: 'Save',
    gold: 'Gold',
    id: 'ID',
    copied: 'Copied',
    logout: 'Logout'
  },
  ar: {
    home: 'الرئيسية',
    games: 'ألعاب',
    studio: 'استوديو',
    im: 'محادثات',
    me: 'أنا',
    activeRooms: 'غرف نشطة',
    create: 'إنشاء',
    roomTitle: 'عنوان الغرفة',
    desc: 'الوصف',
    cancel: 'إلغاء',
    createRoom: 'إنشاء غرفة',
    gameCenter: 'مركز الألعاب',
    back: 'رجوع',
    loading: 'جاري التحميل',
    playNow: 'العب الآن',
    aiStudio: 'استوديو الذكاء الاصطناعي',
    tapToUpload: 'اضغط لرفع صورة',
    magicProgress: 'جاري تنفيذ السحر...',
    promptPlaceholder: 'صف التغييرات...',
    go: 'انطلق',
    messages: 'الرسائل',
    askMe: 'اسألني أي شيء...',
    now: 'الآن',
    saySomething: 'قل شيئاً...',
    sendGift: 'إرسال هدية',
    roomUsers: 'المستخدمين',
    host: 'المضيف',
    guest: 'ضيف',
    globalNetwork: 'الشبكة العالمية',
    swipeRotate: 'اسحب للتدوير',
    connections: 'اتصالات',
    sharedInterest: 'اهتمامات مشتركة',
    closeMap: 'إغلاق الخريطة',
    profile: 'الملف الشخصي',
    editProfile: 'تعديل الملف',
    wallet: 'المحفظة',
    store: 'المتجر',
    settings: 'الإعدادات',
    language: 'اللغة',
    privacy: 'الخصوصية',
    save: 'حفظ',
    gold: 'ذهب',
    id: 'المعرف',
    copied: 'تم النسخ',
    logout: 'خروج'
  }
};

export const MOCK_CHATS = [
  { id: 'c1', name: 'Ahmed', avatar: '#FF5722', lastMessage: 'See you in the room!', time: '10:30 AM' },
  { id: 'c2', name: 'Sarah', avatar: '#2196F3', lastMessage: 'Thanks for the gift 🎁', time: 'Yesterday' },
];

export const GIFTS = [
  { id: 'g1', name: 'Rose', icon: '🌹', cost: 10 },
  { id: 'g2', name: 'Heart', icon: '❤️', cost: 50 },
  { id: 'g3', name: 'Car', icon: '🏎️', cost: 500 },
  { id: 'g4', name: 'Rocket', icon: '🚀', cost: 1000 },
];

export const QUICK_REPLIES = [
  'Hello! 👋', 'Welcome! 🌟', 'Nice voice! 🎤', 'Hahahaha 😂', 'Mashallah ✨'
];

export const REACTIONS = ['❤️', '😂', '😮', '👍', '🔥'];

export const GAMES = [
  { id: 'game1', name: 'Ludo Star', icon: '🎲', color: '#4CAF50' },
  { id: 'game2', name: 'Dominoes', icon: '🁙', color: '#FF5722' },
  { id: 'game3', name: 'Uno', icon: '🃏', color: '#F44336' },
  { id: 'game4', name: 'Billiards', icon: '🎱', color: '#2196F3' },
];

export const getRank = (gold: number) => {
  if (gold > 10000) return { name: 'Emperor', color: '#FFD700' };
  if (gold > 5000) return { name: 'King', color: '#C0C0C0' };
  if (gold > 1000) return { name: 'Noble', color: '#CD7F32' };
  return { name: 'Citizen', color: '#FFFFFF' };
};