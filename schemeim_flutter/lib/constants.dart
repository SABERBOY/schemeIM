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
  static const Color textSecondary = Color(0xFFB0B0B0);
  static const Color danger = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
}

class Gift {
  final String id;
  final String name;
  final String icon;
  final int cost;
  const Gift({required this.id, required this.name, required this.icon, required this.cost});
}

const List<Gift> GIFTS = [
  Gift(id: 'rose', name: 'Rose', icon: '🌹', cost: 1),
  Gift(id: 'tea', name: 'Mint Tea', icon: '🍵', cost: 10),
  Gift(id: 'perfume', name: 'Oud', icon: '⚱️', cost: 50),
  Gift(id: 'camel', name: 'Camel', icon: '🐪', cost: 100),
  Gift(id: 'palace', name: 'Palace', icon: '🕌', cost: 1000),
];

class AvatarFrame {
  final String id;
  final String name;
  final String image;
  const AvatarFrame({required this.id, required this.name, required this.image});
}

const List<AvatarFrame> AVATAR_FRAMES = [
  AvatarFrame(id: 'none', name: 'Default', image: ''),
  AvatarFrame(id: 'gold_luxury', name: 'Gold Luxury', image: '''<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><defs><linearGradient id='g' x1='0' y1='0' x2='1' y2='1'><stop offset='0%' stop-color='#FFD700'/><stop offset='50%' stop-color='#FFA500'/><stop offset='100%' stop-color='#FFD700'/></linearGradient></defs><circle cx='50' cy='50' r='46' fill='none' stroke='url(#g)' stroke-width='6'/><circle cx='50' cy='50' r='46' fill='none' stroke='white' stroke-width='1' stroke-dasharray='2 5'/></svg>'''),
  AvatarFrame(id: 'neon_blue', name: 'Neon Blue', image: '''<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><circle cx='50' cy='50' r='47' fill='none' stroke='#00FFFF' stroke-width='4' filter='drop-shadow(0 0 5px #00FFFF)'/></svg>'''),
  AvatarFrame(id: 'royal_purple', name: 'Royal', image: '''<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><circle cx='50' cy='50' r='46' fill='none' stroke='#9C27B0' stroke-width='6'/><circle cx='50' cy='0' r='5' fill='#FFD700'/><circle cx='50' cy='100' r='5' fill='#FFD700'/></svg>'''),
  AvatarFrame(id: 'rose_garden', name: 'Rose Garden', image: '''<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><circle cx='50' cy='50' r='46' fill='none' stroke='#E91E63' stroke-width='4'/><circle cx='15' cy='50' r='8' fill='#E91E63'/><circle cx='85' cy='50' r='8' fill='#E91E63'/></svg>'''),
];

class GameItem {
  final String id;
  final String name;
  final String icon;
  final Color color;
  const GameItem({required this.id, required this.name, required this.icon, required this.color});
}

const List<GameItem> GAMES = [
  GameItem(id: 'ludo', name: 'Ludo Star', icon: '🎲', color: Color(0xFFE91E63)),
  GameItem(id: 'domino', name: 'Domino Pro', icon: '🀄', color: Color(0xFF2196F3)),
  GameItem(id: 'carrom', name: 'Carrom Disc', icon: '⚪', color: Color(0xFFFF9800)),
  GameItem(id: 'uno', name: 'Uno Classic', icon: '🃏', color: Color(0xFF4CAF50)),
];

const List<String> QUICK_REPLIES = [
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

const List<String> REACTIONS = ['❤️', '😂', '👍', '🔥', '😮', '😢'];

final List<ChatContact> MOCK_CHATS = [
  ChatContact(id: 'u1', name: 'Habibi User 1', avatar: '#E91E63', frame: AVATAR_FRAMES[1].image, lastMessage: 'Salam! How are you doing?', time: '12:30 PM'),
  ChatContact(id: 'u2', name: 'Habibi User 2', avatar: '#2196F3', frame: AVATAR_FRAMES[2].image, lastMessage: 'Coming to the room?', time: '11:45 AM'),
  ChatContact(id: 'u3', name: 'Habibi User 3', avatar: '#FF9800', lastMessage: 'Thanks for the gift!', time: 'Yesterday'),
];

final List<Room> MOCK_ROOMS = [
  Room(
    id: '1', 
    title: 'Dubai Chill 🌴', 
    country: '🇦🇪', 
    host: User(id: 'h1', name: 'Ahmed', avatar: 'https://cdn-icons-png.flaticon.com/512/4825/4825038.png', gold: 0, frame: AVATAR_FRAMES[3].image), 
    users: [], 
    tags: ['Music', 'Chat']
  ),
  Room(
    id: '2', 
    title: 'Riyadh Nights 🌙', 
    country: '🇸🇦', 
    host: User(id: 'h2', name: 'Sarah', avatar: 'https://cdn-icons-png.flaticon.com/512/4825/4825112.png', gold: 0), 
    users: [], 
    tags: ['Poetry']
  ),
  Room(
    id: '3', 
    title: 'Cairo Vibes 🇪🇬', 
    country: '🇪🇬', 
    host: User(id: 'h3', name: 'Omar', avatar: 'https://cdn-icons-png.flaticon.com/512/4825/4825044.png', gold: 0, frame: AVATAR_FRAMES[2].image), 
    users: [], 
    tags: ['Funny']
  ),
];

