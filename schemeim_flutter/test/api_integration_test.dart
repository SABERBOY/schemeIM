import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:schemeim_flutter/constants.dart';
import 'package:schemeim_flutter/protos/messages/chatroom.pb.dart';
import 'package:schemeim_flutter/services/api_service.dart';
import 'package:schemeim_flutter/protos/messages/auth.pb.dart' as authpb;
import 'package:schemeim_flutter/protos/models/user.pb.dart' as userpb;
import 'package:schemeim_flutter/protos/models/room.pb.dart' as roombp;
import 'package:schemeim_flutter/protos/messages/user.pb.dart' as usermsgpb;
import 'package:schemeim_flutter/protos/messages/chatroom.pb.dart'
    as chatroompb;
import 'package:uuid/uuid.dart';

void main() {
  late Dio dio;
  late AuthApi authApi;
  late UserApi userApi;
  late RoomApi roomApi;
  String? authToken;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: API_BASE_URL));

    // Add simple interceptor to inject token for User/Room APIs
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (authToken != null && authToken!.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $authToken';
          }
          return handler.next(options);
        },
      ),
    );

    authApi = AuthApi(dio);
    userApi = UserApi(dio);
    roomApi = RoomApi(dio);
  });

  group('API Integration Tests', () {
    // test data
    /*  test('0. Test data', () async {
      const data = '{"code": 200, "message": "success", "data": {}}';
      // Use mergeFromProto3Json for standard JSON parsing
      final common.Response response = common.Response()
        ..mergeFromProto3Json(json.decode(data));
      print('Response: ${response.toString()}');
      expect(response.code, equals(200));
      expect(response.message, equals('success'));
      expect(response.hasData(), isTrue);
    }); */

    // 1. Auth Tests
    test('1. AuthApi: sendOtp returns success', () async {
      const phone = '501234567';
      final result = await authApi.sendOtp(phone);
      expect(result, isTrue);
    });

    test('2. AuthApi: login returns valid token and user', () async {
      const phone = '501234567';
      const code = '123456';

      final sendOtpResult = await authApi.sendOtp(phone);
      expect(sendOtpResult, isTrue);
      final result = await authApi.login(phone, code);

      // AuthApi.login returns protobuf LoginResponse (messages/auth.pb.dart),
      // not the json_serializable model (models/login_response.dart).
      expect(result, isA<authpb.LoginResponse>());
      expect(result.token, isNotEmpty);
      expect(result.user, isA<userpb.User>());

      // Save token for subsequent tests
      authToken = result.token;
      print('Logged in successfully. Token stored.');
    });

    // 2. User Tests (Dependent on Login)
    test('3. UserApi: getProfile returns current user', () async {
      if (authToken == null) {
        // Fallback login if running independently (though tests usually run in order in a group)
        const phone = '501234567';
        const code = '123456';
        final loginRes = await authApi.login(phone, code);
        authToken = loginRes.token;
      }

      final user = await userApi.getProfile();
      expect(user, isA<userpb.User>());
      expect(user.id, isNotEmpty);
      expect(user.displayName, isNotEmpty);
      print('User Profile: ${user.displayName} (Level ${user.level})');
    });

    test('4. UserApi: updateProfile updates user data', () async {
      if (authToken == null) {
        const phone = '501234567';
        const code = '123456';
        final loginRes = await authApi.login(phone, code);
        authToken = loginRes.token;
      }

      final before = await userApi.getProfile();
      // Create update with a modified display name (appending timestamp to make it unique/testable)
      final newName = 'User ${DateTime.now().millisecondsSinceEpoch % 1000}';
      final updates = usermsgpb.UpdateProfileRequest(displayName: newName);
      final updatedUser = await userApi.updateProfile(updates);
      expect(updatedUser.id, equals(before.id));
      // With protobuf field-name payload (snake_case), displayName should update.
      expect(updatedUser.displayName, equals(newName));
      print('User Profile Updated: ${updatedUser.displayName}');
    });

    // 3. Room Tests (Dependent on Login)
    test('5. RoomApi: list returns list of rooms', () async {
      if (authToken == null) fail('No auth token available');

      final rooms = await roomApi.list();
      expect(rooms, isA<ChatRoomListResponse>());
      // Note: List might be empty if no rooms exist, but should not throw
      print('Fetched ${rooms.list.length} rooms');
    });

    test(
      '6. RoomApi: create creates a new room',
      () async {
        if (authToken == null) {
          const phone = '501234567';
          const code = '123456';
          final loginRes = await authApi.login(phone, code);
          authToken = loginRes.token;
        }

        // Get current user to set as host (though backend usually sets host from token)
        final host = await userApi.getProfile();

        final chatroomId = const Uuid().v4();
        final req = chatroompb.ChatRoomCreateRequest(
          chatroomId: chatroomId,
          name: 'Test Room ${DateTime.now().millisecondsSinceEpoch}',
          hostId: host.id,
          tags: 'Test,Integration',
          countryFlag: '🇦🇪',
          description: 'Integration test room',
          destroyType: 0,
          destroyTime: 0,
          isBan: false,
          needNotify: false,
          extra: '',
        );

        final createdRoom = await roomApi.create(req);

        expect(createdRoom, isA<ChatRoomCreateResponse>());
        expect(createdRoom.chatroomId, isNotEmpty);
        expect(createdRoom.message, isNotEmpty);
        print(
          'Created Room: ${createdRoom.chatroomId} (ID: ${createdRoom.chatroomId})',
        );
      },
      skip:
          'Requires server chatroom provider credentials (RongCloud App-Key).',
    );
  });
}
