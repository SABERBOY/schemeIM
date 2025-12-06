class User {
  final String id;
  final String name;
  final String avatar;
  final int gold;
  final String? frame;
  final bool? isHost;
  final UserPrivacy? privacy;

  User({
    required this.id,
    required this.name,
    required this.avatar,
    required this.gold,
    this.frame,
    this.isHost,
    this.privacy,
  });

  User copyWith({
    String? id,
    String? name,
    String? avatar,
    int? gold,
    String? frame,
    bool? isHost,
    UserPrivacy? privacy,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      gold: gold ?? this.gold,
      frame: frame ?? this.frame,
      isHost: isHost ?? this.isHost,
      privacy: privacy ?? this.privacy,
    );
  }
}

class UserPrivacy {
  final bool showSocialList;

  UserPrivacy({required this.showSocialList});
}

