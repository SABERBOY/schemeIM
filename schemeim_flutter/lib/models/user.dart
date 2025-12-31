import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  final String id;
  @JsonKey(name: 'display_name')
  final String displayName;
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  @JsonKey(name: 'frame_url')
  final String? frameUrl;
  @JsonKey(name: 'gold_balance')
  final int goldBalance;
  final int level;
  @JsonKey(name: 'is_verified')
  final bool isVerified;
  final UserPrivacy? privacy;
  final UserRank? rank;

  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  // New fields to handle flattened response
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @JsonKey(name: 'rank_name')
  final String? rankName;
  @JsonKey(name: 'rank_color_hex')
  final String? rankColorHex;

  User({
    required this.id,
    required this.displayName,
    required this.avatarUrl,
    this.frameUrl,
    required this.goldBalance,
    required this.level,
    required this.isVerified,
    this.privacy,
    this.rank,
    this.createdAt,
    this.updatedAt,
    this.phoneNumber,
    this.rankName,
    this.rankColorHex,
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
    String? createdAt,
    String? updatedAt,
    String? phoneNumber,
    String? rankName,
    String? rankColorHex,
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
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      rankName: rankName ?? this.rankName,
      rankColorHex: rankColorHex ?? this.rankColorHex,
    );
  }

  // Custom Json deserialization to handle flattened or nested structure
  factory User.fromJson(Map<String, dynamic> json) {
    // Attempt to reconstruct nested objects if they are missing but fields are present
    // However, json_serializable is strict.
    // If 'privacy' is null in JSON, it should be nullable in Dart.
    // I made privacy nullable above.

    // For rank, if rank object is missing but rank_name is present, we can construct rank object manually or just use the flattened fields.
    // Let's rely on standard generation first with nullable fields.
    var user = _$UserFromJson(json);

    // If rank is null but rankName is not, construct a UserRank
    if (user.rank == null &&
        user.rankName != null &&
        user.rankColorHex != null) {
      user = user.copyWith(
        rank: UserRank(rankName: user.rankName!, colorHex: user.rankColorHex!),
      );
    }

    return user;
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class UserPrivacy {
  @JsonKey(name: 'show_social_list')
  final bool showSocialList;
  @JsonKey(name: 'show_online_status')
  final bool showOnlineStatus;

  UserPrivacy({required this.showSocialList, required this.showOnlineStatus});

  factory UserPrivacy.fromJson(Map<String, dynamic> json) =>
      _$UserPrivacyFromJson(json);

  Map<String, dynamic> toJson() => _$UserPrivacyToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class UserRank {
  @JsonKey(name: 'rank_name')
  final String rankName;
  @JsonKey(name: 'rank_color_hex')
  final String colorHex;

  UserRank({required this.rankName, required this.colorHex});

  factory UserRank.fromJson(Map<String, dynamic> json) =>
      _$UserRankFromJson(json);

  Map<String, dynamic> toJson() => _$UserRankToJson(this);
}
