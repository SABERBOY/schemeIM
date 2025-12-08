class User {
  final String id;
  final String displayName;
  final String avatarUrl;
  final String? frameUrl;
  final int goldBalance;
  final int level;
  final bool isVerified;
  final UserPrivacy privacy;
  final UserRank? rank;

  User({
    required this.id,
    required this.displayName,
    required this.avatarUrl,
    this.frameUrl,
    required this.goldBalance,
    required this.level,
    required this.isVerified,
    required this.privacy,
    this.rank,
  });

  User copyWith({
    String? id,
    String? displayName,
    String? avatarUrl,
    String? frameUrl,
    int? goldBalance,
    int? level,
    bool? isVerified,
    UserPrivacy? privacy,
    UserRank? rank,
  }) {
    return User(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      frameUrl: frameUrl ?? this.frameUrl,
      goldBalance: goldBalance ?? this.goldBalance,
      level: level ?? this.level,
      isVerified: isVerified ?? this.isVerified,
      privacy: privacy ?? this.privacy,
      rank: rank ?? this.rank,
    );
  }
}

class UserPrivacy {
  final bool showSocialList;
  final bool showOnlineStatus;

  UserPrivacy({required this.showSocialList, required this.showOnlineStatus});
}

class UserRank {
  final String rankName;
  final String colorHex;

  UserRank({required this.rankName, required this.colorHex});
}
