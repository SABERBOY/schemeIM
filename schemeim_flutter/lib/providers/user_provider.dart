import 'package:flutter/material.dart';
import '../models/user.dart';
import '../constants.dart';

// UserProvider now only handles UI-related state (language, theme)
// User data is managed by Riverpod userProvider in api_service.dart
class UserProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  String _language = 'en';

  User _currentUser = User(
    id: 'user_123',
    displayName: 'Guest',
    avatarUrl: 'https://cdn-icons-png.flaticon.com/512/147/147142.png',
    frameUrl: '',
    goldBalance: 0,
    level: 1,
    isVerified: false,
    privacy: UserPrivacy(showSocialList: true, showOnlineStatus: true),
    rank: UserRank(rankName: 'Citizen', colorHex: '#FFFFFF'),
  );

  bool get isLoggedIn => _isLoggedIn;
  String get language => _language;
  User get currentUser => _currentUser;

  void updateUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

  void completeLogin() {
    _isLoggedIn = true;
    notifyListeners();
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
