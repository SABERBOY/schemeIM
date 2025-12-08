import 'dart:ui';
import 'models/chat_contact.dart';
import 'models/room.dart';
import 'models/user.dart';

class AppTheme {
  static const Color primary = Color(0xFF7B1FA2); // Deep Purple
  static const Color secondary = Color(0xFFFFD700); // Gold
  static const Color bg = Color(0xFF121212);
  static const Color surface = Color(0xFF1E1E1E);
  static const Color text = Color(0xFFFFFFFF);
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color textSecondary = Color(0xFFB0B0B0);
  static const Color danger = Color(0xFFD32F2F);
}

class AvatarFrame {
  final String id;
  final String image;
  final String name;
  const AvatarFrame({
    required this.id,
    required this.image,
    required this.name,
  });
}

// const List<AvatarFrame> AVATAR_FRAMES = [
//   AvatarFrame(id: '1', image: '', name: 'None'),
//   AvatarFrame(
//     id: '2',
//     image: 'https://cdn-icons-png.flaticon.com/512/4315/4315445.png',
//     name: 'Gold',
//   ),
//   AvatarFrame(
//     id: '3',
//     image: 'https://cdn-icons-png.flaticon.com/512/4315/4315457.png',
//     name: 'Platinum',
//   ),
//   AvatarFrame(
//     id: '4',
//     image: 'https://cdn-icons-png.flaticon.com/512/4315/4315467.png',
//     name: 'Diamond',
//   ),
// ];

const Map<String, Map<String, String>> TRANSLATIONS = {
  'en': {
    'home': 'Home',
    'games': 'Games',
    'studio': 'Studio',
    'im': 'IM',
    'me': 'Me',
    'activeRooms': 'Active Rooms',
    'create': 'Create',
    'roomTitle': 'Room Title',
    'desc': 'Description',
    'cancel': 'Cancel',
    'createRoom': 'Create Room',
    'gameCenter': 'Game Center',
    'back': 'Back',
    'loading': 'Loading',
    'playNow': 'Play Now',
    'aiStudio': 'AI Image Studio',
    'tapToUpload': 'Tap to upload image',
    'magicProgress': 'Performing Magic...',
    'promptPlaceholder': 'Describe changes...',
    'go': 'Go',
    'messages': 'Messages',
    'askMe': 'Ask me anything...',
    'now': 'Now',
    'saySomething': 'Say something...',
    'sendGift': 'Send Gift',
    'roomUsers': 'Room Users',
    'host': 'Host',
    'guest': 'Guest',
    'globalNetwork': 'Global Network',
    'swipeRotate': 'Swipe to rotate',
    'connections': 'Connections',
    'sharedInterest': 'Shared Interest',
    'closeMap': 'Close Map',
    'profile': 'Profile',
    'editProfile': 'Edit Profile',
    'wallet': 'Wallet',
    'store': 'Store',
    'settings': 'Settings',
    'language': 'Language',
    'privacy': 'Privacy',
    'save': 'Save',
    'gold': 'Gold',
    'id': 'ID',
    'copied': 'Copied',
    'logout': 'Logout',
    'verifiedStatus': 'Verified Status',
    'login': 'Login',
    'welcomeBack': 'Welcome Back',
    'enterPhone': 'Enter Mobile Number',
    'sendCode': 'Send Code',
    'enterCode': 'Enter Verification Code',
    'verify': 'Verify & Login',
    'resendIn': 'Resend in',
    'resend': 'Resend Code',
    'invalidCode': 'Invalid Code',
    'phonePlaceholder': '50 123 4567',
  },
  'ar': {
    'home': 'الرئيسية',
    'games': 'ألعاب',
    'studio': 'استوديو',
    'im': 'محادثات',
    'me': 'أنا',
    'activeRooms': 'غرف نشطة',
    'create': 'إنشاء',
    'roomTitle': 'عنوان الغرفة',
    'desc': 'الوصف',
    'cancel': 'إلغاء',
    'createRoom': 'إنشاء غرفة',
    'gameCenter': 'مركز الألعاب',
    'back': 'رجوع',
    'loading': 'جاري التحميل',
    'playNow': 'العب الآن',
    'aiStudio': 'استوديو الذكاء الاصطناعي',
    'tapToUpload': 'اضغط لرفع صورة',
    'magicProgress': 'جاري تنفيذ السحر...',
    'promptPlaceholder': 'صف التغييرات...',
    'go': 'انطلق',
    'messages': 'الرسائل',
    'askMe': 'اسألني أي شيء...',
    'now': 'الآن',
    'saySomething': 'قل شيئاً...',
    'sendGift': 'إرسال هدية',
    'roomUsers': 'المستخدمين',
    'host': 'المضيف',
    'guest': 'ضيف',
    'globalNetwork': 'الشبكة العالمية',
    'swipeRotate': 'اسحب للتدوير',
    'connections': 'اتصالات',
    'sharedInterest': 'اهتمامات مشتركة',
    'closeMap': 'إغلاق الخريطة',
    'profile': 'الملف الشخصي',
    'editProfile': 'تعديل الملف',
    'wallet': 'المحفظة',
    'store': 'المتجر',
    'settings': 'الإعدادات',
    'language': 'اللغة',
    'privacy': 'الخصوصية',
    'save': 'حفظ',
    'gold': 'ذهب',
    'id': 'المعرف',
    'copied': 'تم النسخ',
    'logout': 'خروج',
    'verifiedStatus': 'حالة التحقق',
    'login': 'تسجيل الدخول',
    'welcomeBack': 'أهلاً بعودتك',
    'enterPhone': 'أدخل رقم الهاتف',
    'sendCode': 'أرسل الرمز',
    'enterCode': 'أدخل رمز التحقق',
    'verify': 'تحقق ودخول',
    'resendIn': 'إعادة إرسال خلال',
    'resend': 'إعادة الإرسال',
    'invalidCode': 'رمز غير صحيح',
    'phonePlaceholder': '50 123 4567',
  },
};

final List<ChatContact> MOCK_CHATS = [
  ChatContact(
    id: 'c1',
    name: 'Ahmed',
    avatar: '#FF5722',
    lastMessage: 'See you in the room!',
    time: '10:30 AM',
    frame: AVATAR_FRAMES[1].image,
  ),
  ChatContact(
    id: 'c2',
    name: 'Sarah',
    avatar: '#2196F3',
    lastMessage: 'Thanks for the gift 🎁',
    time: 'Yesterday',
    frame: AVATAR_FRAMES[2].image,
  ),
];

class Gift {
  final String id;
  final String name;
  final String icon;
  final int cost;
  const Gift({
    required this.id,
    required this.name,
    required this.icon,
    required this.cost,
  });
}

const List<Gift> GIFTS = [
  Gift(id: 'g1', name: 'Rose', icon: '🌹', cost: 10),
  Gift(id: 'g2', name: 'Heart', icon: '❤️', cost: 50),
  Gift(id: 'g3', name: 'Car', icon: '🏎️', cost: 500),
  Gift(id: 'g4', name: 'Rocket', icon: '🚀', cost: 1000),
  Gift(id: 'rose', name: 'Rose', icon: '🌹', cost: 1),
  Gift(id: 'tea', name: 'Mint Tea', icon: '🍵', cost: 10),
  Gift(id: 'perfume', name: 'Oud', icon: '⚱️', cost: 50),
  Gift(id: 'camel', name: 'Camel', icon: '🐪', cost: 100),
  Gift(id: 'palace', name: 'Palace', icon: '🕌', cost: 1000),
];
// class AvatarFrame {
//   final String id;
//   final String name;
//   final String image;
//   const AvatarFrame({required this.id, required this.name, required this.image});
// }

const List<AvatarFrame> AVATAR_FRAMES = [
  AvatarFrame(id: 'none', name: 'Default', image: ''),
  AvatarFrame(id: 'gold_luxury', name: 'Gold Luxury', image: '''<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><defs><linearGradient id='g' x1='0' y1='0' x2='1' y2='1'><stop offset='0%' stop-color='#FFD700'/><stop offset='50%' stop-color='#FFA500'/><stop offset='100%' stop-color='#FFD700'/></linearGradient></defs><circle cx='50' cy='50' r='46' fill='none' stroke='url(#g)' stroke-width='6'/><circle cx='50' cy='50' r='46' fill='none' stroke='white' stroke-width='1' stroke-dasharray='2 5'/></svg>'''),
  AvatarFrame(id: 'neon_blue', name: 'Neon Blue', image: '''<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><circle cx='50' cy='50' r='47' fill='none' stroke='#00FFFF' stroke-width='4' filter='drop-shadow(0 0 5px #00FFFF)'/></svg>'''),
  AvatarFrame(id: 'royal_purple', name: 'Royal', image: '''<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><circle cx='50' cy='50' r='46' fill='none' stroke='#9C27B0' stroke-width='6'/><circle cx='50' cy='0' r='5' fill='#FFD700'/><circle cx='50' cy='100' r='5' fill='#FFD700'/></svg>'''),
  AvatarFrame(id: 'rose_garden', name: 'Rose Garden', image: '''<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><circle cx='50' cy='50' r='46' fill='none' stroke='#E91E63' stroke-width='4'/><circle cx='15' cy='50' r='8' fill='#E91E63'/><circle cx='85' cy='50' r='8' fill='#E91E63'/></svg>'''),
];
const List<String> QUICK_REPLIES = [
  'Hello! 👋',
  'Welcome! 🌟',
  'Nice voice! 🎤',
  'Hahahaha 😂',
  'Mashallah ✨',
  'Nice to meet you! 🤝',
];

const List<String> REACTIONS = ['❤️', '😂', '😮', '👍', '🔥'];

class GameItem {
  final String id;
  final String name;
  final String icon;
  final Color color;
  const GameItem({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });
}

const List<GameItem> GAMES = [
  GameItem(
    id: 'game1',
    name: 'Ludo Star',
    icon: '🎲',
    color: Color(0xFF4CAF50),
  ),
  GameItem(id: 'game2', name: 'Dominoes', icon: '🁙', color: Color(0xFFFF5722)),
  GameItem(id: 'game3', name: 'Uno', icon: '🃏', color: Color(0xFFF44336)),
  GameItem(
    id: 'game4',
    name: 'Billiards',
    icon: '🎱',
    color: Color(0xFF2196F3),
  ),
];

const Map<String, Map<String, String>> TRANSLATIONS = {
  'en': {
    'home': 'Home',
    'games': 'Games',
    'studio': 'Studio',
    'im': 'IM',
    'me': 'Me',
    'activeRooms': 'Active Rooms',
    'create': 'Create',
    'roomTitle': 'Room Title',
    'desc': 'Description',
    'cancel': 'Cancel',
    'createRoom': 'Create Room',
    'gameCenter': 'Game Center',
    'back': 'Back',
    'loading': 'Loading',
    'playNow': 'Play Now',
    'aiStudio': 'AI Image Studio',
    'tapToUpload': 'Tap to upload image',
    'magicProgress': 'Performing Magic...',
    'promptPlaceholder': 'Describe changes...',
    'go': 'Go',
    'messages': 'Messages',
    'askMe': 'Ask me anything...',
    'now': 'Now',
    'saySomething': 'Say something...',
    'sendGift': 'Send Gift',
    'roomUsers': 'Room Users',
    'host': 'Host',
    'guest': 'Guest',
    'globalNetwork': 'Global Network',
    'swipeRotate': 'Swipe to rotate',
    'connections': 'Connections',
    'sharedInterest': 'Shared Interest',
    'closeMap': 'Close Map',
    'profile': 'Profile',
    'editProfile': 'Edit Profile',
    'wallet': 'Wallet',
    'store': 'Store',
    'settings': 'Settings',
    'language': 'Language',
    'privacy': 'Privacy',
    'save': 'Save',
    'gold': 'Gold',
    'id': 'ID',
    'copied': 'Copied',
    'logout': 'Logout',
    'verifiedStatus': 'Verified Status',
    'login': 'Login',
    'welcomeBack': 'Welcome Back',
    'enterPhone': 'Enter Mobile Number',
    'sendCode': 'Send Code',
    'enterCode': 'Enter Verification Code',
    'verify': 'Verify & Login',
    'resendIn': 'Resend in',
    'resend': 'Resend Code',
    'invalidCode': 'Invalid Code',
    'phonePlaceholder': '50 123 4567'
  },
  'ar': {
    'home': 'الرئيسية',
    'games': 'ألعاب',
    'studio': 'استوديو',
    'im': 'محادثات',
    'me': 'أنا',
    'activeRooms': 'غرف نشطة',
    'create': 'إنشاء',
    'roomTitle': 'عنوان الغرفة',
    'desc': 'الوصف',
    'cancel': 'إلغاء',
    'createRoom': 'إنشاء غرفة',
    'gameCenter': 'مركز الألعاب',
    'back': 'رجوع',
    'loading': 'جاري التحميل',
    'playNow': 'العب الآن',
    'aiStudio': 'استوديو الذكاء الاصطناعي',
    'tapToUpload': 'اضغط لرفع صورة',
    'magicProgress': 'جاري تنفيذ السحر...',
    'promptPlaceholder': 'صف التغييرات...',
    'go': 'انطلق',
    'messages': 'الرسائل',
    'askMe': 'اسألني أي شيء...',
    'now': 'الآن',
    'saySomething': 'قل شيئاً...',
    'sendGift': 'إرسال هدية',
    'roomUsers': 'المستخدمين',
    'host': 'المضيف',
    'guest': 'ضيف',
    'globalNetwork': 'الشبكة العالمية',
    'swipeRotate': 'اسحب للتدوير',
    'connections': 'اتصالات',
    'sharedInterest': 'اهتمامات مشتركة',
    'closeMap': 'إغلاق الخريطة',
    'profile': 'الملف الشخصي',
    'editProfile': 'تعديل الملف',
    'wallet': 'المحفظة',
    'store': 'المتجر',
    'settings': 'الإعدادات',
    'language': 'اللغة',
    'privacy': 'الخصوصية',
    'save': 'حفظ',
    'gold': 'ذهب',
    'id': 'المعرف',
    'copied': 'تم النسخ',
    'logout': 'خروج',
    'verifiedStatus': 'حالة التحقق',
    'login': 'تسجيل الدخول',
    'welcomeBack': 'أهلاً بعودتك',
    'enterPhone': 'أدخل رقم الهاتف',
    'sendCode': 'أرسل الرمز',
    'enterCode': 'أدخل رمز التحقق',
    'verify': 'تحقق ودخول',
    'resendIn': 'إعادة إرسال خلال',
    'resend': 'إعادة الإرسال',
    'invalidCode': 'رمز غير صحيح',
    'phonePlaceholder': '50 123 4567'
  }
};
UserRank getRank(int gold) {
  if (gold > 10000) return UserRank(rankName: 'Emperor', colorHex: '#FFD700');
  if (gold > 5000) return UserRank(rankName: 'King', colorHex: '#C0C0C0');
  if (gold > 1000) return UserRank(rankName: 'Noble', colorHex: '#CD7F32');
  return UserRank(rankName: 'Citizen', colorHex: '#FFFFFF');
}
