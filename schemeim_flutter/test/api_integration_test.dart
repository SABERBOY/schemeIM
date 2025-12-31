import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:schemeim_flutter/constants.dart';
import 'package:schemeim_flutter/services/api_service.dart';
import 'package:schemeim_flutter/models/user.dart';
import 'package:schemeim_flutter/models/room.dart';
import 'package:schemeim_flutter/models/login_response.dart';

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
    // 1. Auth Tests
    test('1. AuthApi: sendOtp returns success', () async {
      const phone = '501234567';
      final result = await authApi.sendOtp(phone);
      expect(result, isTrue);
    });

    test('2. AuthApi: login returns valid token and user', () async {
      const phone = '501234567';
      const code = '123456';

      await authApi.sendOtp(phone);
      final result = await authApi.login(phone, code);

      expect(result, isA<LoginResponse>());
      expect(result.token, isNotEmpty);
      expect(result.user, isA<User>());

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
      expect(user, isA<User>());
      expect(user.id, isNotEmpty);
      expect(user.displayName, isNotEmpty);
      print('User Profile: ${user.displayName} (Level ${user.level})');
    });

    test('4. UserApi: updateProfile updates user data', () async {
      if (authToken == null) fail('No auth token available');

      // First get current profile to have a base
      final currentUser = await userApi.getProfile();

      // Create update with a modified display name (appending timestamp to make it unique/testable)
      final newName = 'User ${DateTime.now().millisecondsSinceEpoch % 1000}';
      final updates = currentUser.copyWith(displayName: newName);

      final updatedUser = await userApi.updateProfile(updates);

      expect(updatedUser.displayName, equals(newName));
      print('User Profile Updated: ${updatedUser.displayName}');
    });

    // 3. Room Tests (Dependent on Login)
    test('5. RoomApi: list returns list of rooms', () async {
      if (authToken == null) fail('No auth token available');

      final rooms = await roomApi.list();
      expect(rooms, isA<List<Room>>());
      // Note: List might be empty if no rooms exist, but should not throw
      print('Fetched ${rooms.length} rooms');
    });

    test('6. RoomApi: create creates a new room', () async {
      if (authToken == null) fail('No auth token available');

      // Get current user to set as host (though backend usually sets host from token)
      final host = await userApi.getProfile();

      final newRoom = Room(
        id: '', // Server assigns ID
        title: 'Test Room ${DateTime.now().millisecondsSinceEpoch}',
        countryFlag: '🇦🇪',
        tags: ['Test', 'Integration'],
        host: host,
        seats: [], // Assuming empty seats init
        onlineCount: 0,
        description: 'Integration test room',
      );

      final createdRoom = await roomApi.create(newRoom);

      expect(createdRoom, isA<Room>());
      expect(createdRoom.id, isNotEmpty);
      expect(createdRoom.title, equals(newRoom.title));
      print('Created Room: ${createdRoom.title} (ID: ${createdRoom.id})');
    });
  });
}
