import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/api_service.dart';
import '../constants.dart';

class UserProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  String _language = 'en';

  User _currentUser = User(
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

  bool get isLoggedIn => _isLoggedIn;
  String get language => _language;
  User get currentUser => _currentUser;

  void updateUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

  Future<void> authenticate(String phone, String code) async {
    final user = await ApiService.auth.login(phone, code);
    _currentUser = user;
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
