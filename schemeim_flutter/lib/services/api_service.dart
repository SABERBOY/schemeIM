import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:typed_data';
import '../constants.dart';
import '../protos/messages/auth.pb.dart' as authpb;
import '../protos/messages/chatroom.pb.dart' as chatroompb;
import '../protos/messages/user.pb.dart' as usermsgpb;
import 'package:schemeim_flutter/protos/models/common.pb.dart' as common;
import 'package:schemeim_flutter/protos/models/room.pb.dart' as roombp;
import 'package:schemeim_flutter/protos/models/user.pb.dart' as userpb;
import 'package:schemeim_flutter/protos/models/wallet.pb.dart' as walletpb;

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
final economyApiProvider = Provider<EconomyApi>(
  (ref) => EconomyApi(ref.read(dioProvider)),
);

// Base API Class
abstract class BaseApi {
  final Dio dio;

  BaseApi(this.dio);
}

/* common.Response _parseCommonResponse(dynamic responseData) {
  return common.Response()..mergeFromProto3Json(responseData);
}

Map<String, dynamic> _commonDataAsMap(common.Response resp) {
  final json = _normalizeProto3JsonNumbers(resp.data.toProto3Json());
  if (json is Map) return Map<String, dynamic>.from(json);
  return <String, dynamic>{};
}

Map<String, dynamic> _updateProfileRequestToSnakeJson(
  usermsgpb.UpdateProfileRequest req,
) {
  final json = <String, dynamic>{};
  if (req.hasDisplayName()) json['display_name'] = req.displayName;
  if (req.hasAvatarUrl()) json['avatar_url'] = req.avatarUrl;
  if (req.hasFrameUrl()) json['frame_url'] = req.frameUrl;
  if (req.hasRankName()) json['rank_name'] = req.rankName;
  return json;
}

Map<String, dynamic> _chatRoomCreateRequestToSnakeJson(
  chatroompb.ChatRoomCreateRequest req,
) {
  final json = <String, dynamic>{};
  if (req.hasChatroomId()) json['chatroom_id'] = req.chatroomId;
  if (req.hasName()) json['name'] = req.name;
  if (req.hasHostId()) json['host_id'] = req.hostId;
  if (req.hasTags()) json['tags'] = req.tags;
  if (req.hasCountryFlag()) json['country_flag'] = req.countryFlag;
  if (req.hasDescription()) json['description'] = req.description;
  if (req.hasDestroyType()) json['destroy_type'] = req.destroyType;
  if (req.hasDestroyTime()) json['destroy_time'] = req.destroyTime;
  if (req.hasIsBan()) json['is_ban'] = req.isBan;
  if (req.whiteUserIds.isNotEmpty) json['white_user_ids'] = req.whiteUserIds;
  if (req.hasNeedNotify()) json['need_notify'] = req.needNotify;
  if (req.hasExtra()) json['extra'] = req.extra;
  return json;
}

void _ensureSuccess(common.Response resp) {
  if (resp.code != 200) {
    throw resp.message;
  }
} */

class AuthApi extends BaseApi {
  AuthApi(super.dio);

  Future<bool> sendOtp(String phone) async {
    try {
      // Real implementation example:
      final response = await dio.post('/auth/send-otp', data: {'phone': phone});
      print('Send OTP Response: ${response.data}');
      final common.Response commonResponse = common.Response()
        ..mergeFromProto3Json(response.data);
      // Uint8List bytes = Uint8List.fromList(commonResponse.data);
      // final sendOtpResponse = authpb.SendOTPResponse.fromBuffer(bytes);
      return response.statusCode == 200 && commonResponse.code == 200;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<authpb.LoginResponse> login(String phone, String code) async {
    try {
      final request = authpb.LoginRequest(phone: phone, code: code);
      final response = await dio.post(
        '/auth/login',
        data: request.toProto3Json(),
      );
      final common.Response commonResponse = common.Response()
        ..mergeFromProto3Json(response.data);
      Uint8List bytes = Uint8List.fromList(commonResponse.data);
      final loginResponse = authpb.LoginResponse.fromBuffer(bytes);
      return loginResponse;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
}

/// google.protobuf.Struct stores all numeric values as doubles.
/// When converting back to proto3 JSON, integral values become `1.0` etc,
/// but protobuf int fields require `int` (or stringified int).
///
/// This normalizes any integral doubles (recursively) back to `int`.
dynamic _normalizeProto3JsonNumbers(dynamic value) {
  if (value is List) {
    return value.map(_normalizeProto3JsonNumbers).toList();
  }
  if (value is Map) {
    return value.map((k, v) => MapEntry(k, _normalizeProto3JsonNumbers(v)));
  }
  if (value is double) {
    final asInt = value.toInt();
    if (value == asInt.toDouble()) return asInt;
  }
  return value;
}

class UserApi extends BaseApi {
  UserApi(super.dio);

  Future<userpb.User> getProfile() async {
    try {
      final response = await dio.get('/user/profile');
      final common.Response commonResponse = common.Response()
        ..mergeFromProto3Json(response.data);
      Uint8List bytes = Uint8List.fromList(commonResponse.data);
      final user = userpb.User.fromBuffer(bytes);
      return user;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<userpb.User> updateProfile(
    usermsgpb.UpdateProfileRequest updates,
  ) async {
    try {
      final response = await dio.put(
        '/user/profile',
        // Backend expects proto field names (snake_case) for request payloads.
        data: updates.toProto3Json(),
        options: Options(contentType: Headers.jsonContentType),
      );
      print('Update Profile Response: ${response.data}');
      final common.Response commonResponse = common.Response()
        ..mergeFromProto3Json(response.data);
      Uint8List bytes = Uint8List.fromList(commonResponse.data);
      final updatedUser = userpb.User.fromBuffer(bytes);
      return updatedUser;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
}

class RoomApi extends BaseApi {
  RoomApi(super.dio);

  Future<chatroompb.ChatRoomListResponse> list() async {
    try {
      final response = await dio.get('/rooms');
      final common.Response commonResponse = common.Response()
        ..mergeFromProto3Json(response.data);
      Uint8List bytes = Uint8List.fromList(commonResponse.data);
      final rooms = chatroompb.ChatRoomListResponse.fromBuffer(bytes);
      return rooms;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<chatroompb.ChatRoomCreateResponse> create(
    chatroompb.ChatRoomCreateRequest req,
  ) async {
    try {
      print('Create Room Request: ${req.toProto3Json()}');
      final response = await dio.post(
        '/chatrooms',
        data: req.toProto3Json(),
        options: Options(contentType: Headers.jsonContentType),
      );
      print('Create Room Response: ${response.data}');
      final common.Response commonResponse = common.Response()
        ..mergeFromProto3Json(response.data);
      Uint8List bytes = Uint8List.fromList(commonResponse.data);
      final createdRoom = chatroompb.ChatRoomCreateResponse.fromBuffer(bytes);
      return createdRoom;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
}

class EconomyApi extends BaseApi {
  EconomyApi(super.dio);

  Future<List<walletpb.Gift>> listGifts() async {
    try {
      final response = await dio.get('/economy/gifts');
      print('List Gifts Response: ${response.data}');
      /* final env = _parseCommonResponse(response.data);
      _ensureSuccess(env);
      final data = _commonDataAsMap(env);
      final listJson = data['list'] ?? data['gifts'] ?? data['items'];
      if (listJson is! List) return <walletpb.Gift>[];
      return listJson.whereType<Map>().map((e) {
        final giftJson = _normalizeProto3JsonNumbers(e);
        return walletpb.Gift()
          ..mergeFromProto3Json(Map<String, dynamic>.from(giftJson as Map));
      }).toList(); */
      return response.data
          .map((e) => walletpb.Gift()..mergeFromProto3Json(e))
          .toList();
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
  static final economy = EconomyApi(_dio);
}
