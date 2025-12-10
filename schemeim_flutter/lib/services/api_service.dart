import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';
import '../models/room.dart';
import '../models/message.dart';
import '../models/chat_contact.dart';
import '../constants.dart';

// Token Provider using Notifier (Riverpod 2.x/3.x recommended approach)
class TokenNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  void setToken(String? token) {
    state = token;
  }
}

final tokenProvider = NotifierProvider<TokenNotifier, String?>(
  TokenNotifier.new,
);

// Dio Provider Configuration
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: API_BASE_URL,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  // Add logging interceptor
  dio.interceptors.add(
    LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ),
  );

  // Add auth interceptor
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        // Add token to headers if available
        final token = ref.read(tokenProvider);
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          // Handle token expiration (logout or refresh)
          ref.read(tokenProvider.notifier).setToken(null);
        }
        return handler.next(e);
      },
    ),
  );

  return dio;
});

// API Providers
final authApiProvider = Provider<AuthApi>(
  (ref) => AuthApi(ref.read(dioProvider)),
);
final userApiProvider = Provider<UserApi>(
  (ref) => UserApi(ref.read(dioProvider)),
);
final roomApiProvider = Provider<RoomApi>(
  (ref) => RoomApi(ref.read(dioProvider)),
);
final chatApiProvider = Provider<ChatApi>(
  (ref) => ChatApi(ref.read(dioProvider)),
);
final economyApiProvider = Provider<EconomyApi>(
  (ref) => EconomyApi(ref.read(dioProvider)),
);

// Base API Class
abstract class BaseApi {
  final Dio dio;
  BaseApi(this.dio);
}

class AuthApi extends BaseApi {
  AuthApi(super.dio);

  Future<bool> sendOtp(String phone) async {
    try {
      // Real implementation example:
      // await dio.post('/auth/send-otp', data: {'phone': phone});

      // Mock implementation:
      await Future.delayed(const Duration(seconds: 1));
      return true;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<User> login(String phone, String code) async {
    try {
      // Real implementation example:
      // final response = await dio.post('/auth/login', data: {
      //   'phone': phone,
      //   'code': code,
      // });
      // return User.fromJson(response.data);

      // Mock implementation:
      await Future.delayed(const Duration(seconds: 1));
      return _mockCurrentUser;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
}

class UserApi extends BaseApi {
  UserApi(super.dio);

  Future<User> getProfile() async {
    try {
      // final response = await dio.get('/user/profile');
      // return User.fromJson(response.data);
      return _mockCurrentUser;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<User> updateProfile(User updates) async {
    try {
      // final response = await dio.put('/user/profile', data: updates.toJson());
      // return User.fromJson(response.data);

      // Update mock (in memory only)
      // Note: In real app, we don't need to update static mock,
      // the server update is enough.
      return updates;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
}

class RoomApi extends BaseApi {
  RoomApi(super.dio);

  Future<List<Room>> list() async {
    try {
      // final response = await dio.get('/rooms');
      // return (response.data as List).map((e) => Room.fromJson(e)).toList();

      return [
        Room(
          id: '1',
          title: 'Dubai Chill 🌴',
          countryFlag: '🇦🇪',
          tags: ['Music', 'Chat'],
          host: _mockCurrentUser.copyWith(
            id: 'h1',
            displayName: 'Ahmed',
            avatarUrl:
                'https://cdn-icons-png.flaticon.com/512/4825/4825038.png',
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
          host: _mockCurrentUser.copyWith(
            id: 'h2',
            displayName: 'Sarah',
            avatarUrl:
                'https://cdn-icons-png.flaticon.com/512/4825/4825112.png',
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
          host: _mockCurrentUser.copyWith(
            id: 'h3',
            displayName: 'Omar',
            avatarUrl:
                'https://cdn-icons-png.flaticon.com/512/4825/4825044.png',
            frameUrl: AVATAR_FRAMES[2].image,
            goldBalance: 0,
          ),
          seats: [],
          onlineCount: 200,
          description: 'Jokes all night',
        ),
      ];
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Room> create(Room room) async {
    try {
      // final response = await dio.post('/rooms', data: room.toJson());
      // return Room.fromJson(response.data);
      return room;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
}

class ChatApi extends BaseApi {
  ChatApi(super.dio);

  Future<List<ChatContact>> listContacts() async {
    try {
      // final response = await dio.get('/chat/contacts');
      // return ...
      return MOCK_CHATS;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Message> send(Message msg) async {
    try {
      // await dio.post('/chat/send', data: msg.toJson());
      return msg;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
}

class EconomyApi extends BaseApi {
  EconomyApi(super.dio);

  Future<List<Gift>> listGifts() async {
    try {
      // final response = await dio.get('/economy/gifts');
      return GIFTS;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
}

// Helper for error handling
String _handleError(DioException e) {
  // Parse error response
  if (e.response != null) {
    final data = e.response?.data;
    if (data is Map && data.containsKey('message')) {
      return data['message'].toString();
    }
    return 'Server error: ${e.response?.statusCode}';
  } else if (e.type == DioExceptionType.connectionTimeout ||
      e.type == DioExceptionType.receiveTimeout) {
    return 'Connection timeout. Please check your internet.';
  } else if (e.type == DioExceptionType.connectionError) {
    return 'No internet connection.';
  }
  return 'Connection error: ${e.message}';
}

// Temporary Mock Data (moved from static to top-level for internal usage)
final User _mockCurrentUser = User(
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

// Backward Compatibility Class (Optional, but helps migration)
// TODO: Remove this after full migration to Riverpod providers
class ApiService {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: API_BASE_URL,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  static final auth = AuthApi(_dio);
  static final user = UserApi(_dio);
  static final room = RoomApi(_dio);
  static final chat = ChatApi(_dio);
  static final economy = EconomyApi(_dio);
}
