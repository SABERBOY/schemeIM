import '../models/user.dart';
import '../models/room.dart';
import '../models/message.dart';
import '../models/chat_contact.dart';
import '../constants.dart';

class ApiService {
  // Mock current user
  static User _currentUser = User(
    id: 'user_123',
    displayName: 'Habibi King',
    avatarUrl: 'https://cdn-icons-png.flaticon.com/512/147/147142.png',
    frameUrl: AVATAR_FRAMES[1].image,
    goldBalance: 500,
    level: 5,
    isVerified: true,
    privacy: UserPrivacy(showSocialList: true, showOnlineStatus: true),
    rank: UserRank(rankName: 'Noble', colorHex: '#CD7F32'),
  );

  static final AuthApi auth = AuthApi();
  static final UserApi user = UserApi();
  static final RoomApi room = RoomApi();
  static final ChatApi chat = ChatApi();
  static final EconomyApi economy = EconomyApi();
}

class AuthApi {
  Future<bool> sendOtp(String phone) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  Future<User> login(String phone, String code) async {
    await Future.delayed(const Duration(seconds: 1));
    return ApiService._currentUser;
  }
}

class UserApi {
  Future<User> getProfile() async {
    return ApiService._currentUser;
  }

  Future<User> updateProfile(User updates) async {
    ApiService._currentUser = updates;
    return ApiService._currentUser;
  }
}

class RoomApi {
  Future<List<Room>> list() async {
    return [
      Room(
        id: '1',
        title: 'Dubai Chill 🌴',
        countryFlag: '🇦🇪',
        tags: ['Music', 'Chat'],
        host: ApiService._currentUser.copyWith(
          id: 'h1',
          displayName: 'Ahmed',
          avatarUrl: 'https://cdn-icons-png.flaticon.com/512/4825/4825038.png',
          frameUrl: AVATAR_FRAMES[3].image,
          goldBalance: 0,
        ),
        seats: [],
        onlineCount: 120,
        description: 'Best vibes in Dubai',
      ),
      Room(
        id: '2',
        title: 'Riyadh Nights 🌙',
        countryFlag: '🇸🇦',
        tags: ['Poetry'],
        host: ApiService._currentUser.copyWith(
          id: 'h2',
          displayName: 'Sarah',
          avatarUrl: 'https://cdn-icons-png.flaticon.com/512/4825/4825112.png',
          frameUrl: '',
          goldBalance: 0,
        ),
        seats: [],
        onlineCount: 85,
        description: 'Poetry and Coffee',
      ),
      Room(
        id: '3',
        title: 'Cairo Vibes 🇪🇬',
        countryFlag: '🇪🇬',
        tags: ['Funny'],
        host: ApiService._currentUser.copyWith(
          id: 'h3',
          displayName: 'Omar',
          avatarUrl: 'https://cdn-icons-png.flaticon.com/512/4825/4825044.png',
          frameUrl: AVATAR_FRAMES[2].image,
          goldBalance: 0,
        ),
        seats: [],
        onlineCount: 200,
        description: 'Jokes all night',
      ),
    ];
  }

  Future<Room> create(Room room) async {
    return room;
  }
}

class ChatApi {
  Future<List<ChatContact>> listContacts() async {
    return MOCK_CHATS;
  }

  Future<Message> send(Message msg) async {
    return msg;
  }
}

class EconomyApi {
  Future<List<Gift>> listGifts() async {
    return GIFTS;
  }
}
