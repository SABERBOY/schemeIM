import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../models/api_response.dart';
import '../models/chat_contact.dart';
import '../models/login_response.dart';
import '../models/message.dart';
import '../models/paginated_response.dart';
import '../models/room.dart';
import '../models/user.dart';
import '../providers/user_provider.dart';

// Shared Preferences Provider
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

// Token Provider using Notifier (Riverpod 2.x/3.x recommended approach)
class TokenNotifier extends Notifier<String?> {
  static const _tokenKey = 'auth_token';

  @override
  String? build() {
    // Load initial token from storage
    final prefs = ref.watch(sharedPreferencesProvider);
    return prefs.getString(_tokenKey);
  }

  Future<void> setToken(String? token) async {
    final prefs = ref.read(sharedPreferencesProvider);
    if (token != null) {
      await prefs.setString(_tokenKey, token);
    } else {
      await prefs.remove(_tokenKey);
    }
    state = token;
  }
}

final tokenProvider = NotifierProvider<TokenNotifier, String?>(
  TokenNotifier.new,
);

// User Provider using Notifier (persists user data)
class UserNotifier extends Notifier<User?> {
  static const _userKey = 'user_data';

  @override
  User? build() {
    // Load initial user from storage
    final prefs = ref.watch(sharedPreferencesProvider);
    final userJson = prefs.getString(_userKey);
    if (userJson != null && userJson.isNotEmpty) {
      try {
        final Map<String, dynamic> jsonMap =
            jsonDecode(userJson) as Map<String, dynamic>;
        return User.fromJson(jsonMap);
      } catch (e) {
        print('Error loading user from storage: $e');
        return null;
      }
    }
    return null;
  }

  Future<void> setUser(User? user) async {
    final prefs = ref.read(sharedPreferencesProvider);
    if (user != null) {
      final userJson = jsonEncode(user.toJson());
      await prefs.setString(_userKey, userJson);
    } else {
      await prefs.remove(_userKey);
    }
    state = user;
  }

  Future<void> updateUser(User user) async {
    await setUser(user);
  }
}

final userProvider = NotifierProvider<UserNotifier, User?>(UserNotifier.new);

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
        // Note: AuthApi requests generally won't have a token yet, which is expected.
        final token = ref.read(tokenProvider);
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          // Handle token expiration (logout or refresh)
          await ref.read(tokenProvider.notifier).setToken(null);
          await ref.read(userProvider.notifier).setUser(null);
          legacyUserProvider.logout();
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
      final response = await dio.post('/auth/send-otp', data: {'phone': phone});
      print('Send OTP Response: ${response.data}');

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      return apiResponse.code == 200;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<LoginResponse> login(String phone, String code) async {
    try {
      // Real implementation example:
      final response = await dio.post(
        '/auth/login',
        data: {'phone': phone, 'code': code},
      );
      print('Login Response: ${response.data}');

      final apiResponse = ApiResponse<LoginResponse>.fromJson(
        response.data,
        (json) => LoginResponse.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
}

class UserApi extends BaseApi {
  UserApi(super.dio);

  Future<User> getProfile() async {
    try {
      final response = await dio.get('/user/profile');
      print('Get Profile Response: ${response.data}');

      final apiResponse = ApiResponse<User>.fromJson(
        response.data,
        (json) => User.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<User> updateProfile(User updates) async {
    try {
      final response = await dio.put('/user/profile', data: updates.toJson());
      print('Update Profile Response: ${response.data}');

      final apiResponse = ApiResponse<User>.fromJson(
        response.data,
        (json) => User.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
}

class RoomApi extends BaseApi {
  RoomApi(super.dio);

  Future<List<Room>> list() async {
    try {
      final response = await dio.get('/rooms');
      print('List Rooms Response: ${response.data.toString()}');

      final apiResponse = ApiResponse<PaginatedResponse<Room>>.fromJson(
        response.data,
        (json) => PaginatedResponse<Room>.fromJson(
          json as Map<String, dynamic>,
          (itemJson) => Room.fromJson(itemJson as Map<String, dynamic>),
        ),
      );

      return apiResponse.data.list;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<ChatRoomCreateResponse> create(ChatRoomCreateRequest room) async {
    try {
      final response = await dio.post('/chatrooms', data: room.toJson());
      print('Create Room Response: ${response.data}');

      final apiResponse = ApiResponse<ChatRoomCreateResponse>.fromJson(
        response.data,
        (json) => ChatRoomCreateResponse.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
}

class ChatApi extends BaseApi {
  ChatApi(super.dio);

  Future<List<ChatContact>> listContacts() async {
    try {
      final response = await dio.get('/chat/contacts');
      print('List Contacts Response: ${response.data}');

      final apiResponse = ApiResponse<List<ChatContact>>.fromJson(
        response.data,
        (json) => (json as List)
            .map((e) => ChatContact.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Message> send(Message msg) async {
    try {
      final response = await dio.post('/chat/send', data: msg.toJson());
      print('Send Message Response: ${response.data}');

      final apiResponse = ApiResponse<Message>.fromJson(
        response.data,
        (json) => Message.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
}

class EconomyApi extends BaseApi {
  EconomyApi(super.dio);

  Future<List<Gift>> listGifts() async {
    try {
      final response = await dio.get('/economy/gifts');
      print('List Gifts Response: ${response.data}');

      final apiResponse = ApiResponse<List<Gift>>.fromJson(response.data, (
        json,
      ) {
        return (json as List).map((e) {
          final map = e as Map<String, dynamic>;
          return Gift(
            id: map['id'] ?? '',
            name: map['name'] ?? '',
            icon: map['icon'] ?? '',
            cost: map['cost'] ?? 0,
          );
        }).toList();
      });

      return apiResponse.data;
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
