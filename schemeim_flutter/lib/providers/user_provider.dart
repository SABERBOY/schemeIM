import 'package:flutter/material.dart';
// import '../models/user.dart';
import '../protos/models/user.pb.dart';
import '../services/api_service.dart';
import '../constants.dart';

class UserProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  String _language = 'en';

  User _currentUser = User.getDefault();
  String _token = '';

  bool get isLoggedIn => _isLoggedIn;
  String get language => _language;
  User get currentUser => _currentUser;

  String get token => _token;

  void updateUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

  Future<void> authenticate(String phone, String code) async {
    final loginResponse = await ApiService.auth.login(phone, code);
    final user = loginResponse.user;
    final token = loginResponse.token;
    _currentUser = user;
    _token = token;
    // Authentication successful, but not yet logged in (waiting for IM)
  }

  void completeLogin() {
    _isLoggedIn = true;
    notifyListeners();
  }

  Future<void> login(String phone, String code) async {
    await authenticate(phone, code);
    completeLogin();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }

  void setLanguage(String lang) {
    if (TRANSLATIONS.containsKey(lang)) {
      _language = lang;
      notifyListeners();
    }
  }

  String t(String key) {
    return TRANSLATIONS[_language]?[key] ?? key;
  }
}
