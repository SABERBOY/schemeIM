import 'package:flutter/material.dart';
import '../models/user.dart';
import '../constants.dart';

class UserProvider with ChangeNotifier {
  User _currentUser = User(
    id: 'user_123',
    name: 'Habibi King',
    avatar: 'https://cdn-icons-png.flaticon.com/512/147/147142.png',
    frame: AVATAR_FRAMES[1].image, // Default Gold Luxury Frame
    gold: 500,
    privacy: UserPrivacy(showSocialList: true),
  );

  User get currentUser => _currentUser;

  void updateUser(User user) {
    _currentUser = user;
    notifyListeners();
  }
}

