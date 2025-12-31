import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:schemeim_flutter/constants.dart';
import 'package:schemeim_flutter/services/api_service.dart';
import 'package:schemeim_flutter/models/user.dart';
import 'package:schemeim_flutter/models/login_response.dart';

void main() {
  late Dio dio;
  late AuthApi authApi;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: API_BASE_URL));
    // Remove DioAdapter to allow real network requests
    authApi = AuthApi(dio);
  });

  group('AuthApi Real Integration Test', () {
    test('sendOtp returns success', () async {
      const phone =
          '501234567'; // Ensure this is a valid test number on your server
      final result = await authApi.sendOtp(phone);
      expect(result, isTrue);
    });

    test('login returns valid token and user', () async {
      const phone = '501234567'; // Use the same test number
      const code =
          '123456'; // Use a valid OTP for this test number (or a fixed test OTP)

      // Ensure sendOtp is called first if required by the backend flow
      await authApi.sendOtp(phone);

      final result = await authApi.login(phone, code);

      expect(result, isA<LoginResponse>());
      expect(result.token, isNotEmpty);
      expect(result.user, isA<User>());
      expect(result.user.id, isNotEmpty);
      print(
        'Logged in user: ${result.user.displayName}, Token: ${result.token}',
      );
    });
  });
}
