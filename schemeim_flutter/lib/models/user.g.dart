// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as String,
  displayName: json['display_name'] as String,
  avatarUrl: json['avatar_url'] as String,
  frameUrl: json['frame_url'] as String?,
  goldBalance: (json['gold_balance'] as num).toInt(),
  level: (json['level'] as num).toInt(),
  isVerified: json['is_verified'] as bool,
  privacy: json['privacy'] == null
      ? null
      : UserPrivacy.fromJson(json['privacy'] as Map<String, dynamic>),
  rank: json['rank'] == null
      ? null
      : UserRank.fromJson(json['rank'] as Map<String, dynamic>),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  phoneNumber: json['phone_number'] as String?,
  rankName: json['rank_name'] as String?,
  rankColorHex: json['rank_color_hex'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'display_name': instance.displayName,
  'avatar_url': instance.avatarUrl,
  'frame_url': instance.frameUrl,
  'gold_balance': instance.goldBalance,
  'level': instance.level,
  'is_verified': instance.isVerified,
  'privacy': instance.privacy,
  'rank': instance.rank,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'phone_number': instance.phoneNumber,
  'rank_name': instance.rankName,
  'rank_color_hex': instance.rankColorHex,
};

UserPrivacy _$UserPrivacyFromJson(Map<String, dynamic> json) => UserPrivacy(
  showSocialList: json['show_social_list'] as bool,
  showOnlineStatus: json['show_online_status'] as bool,
);

Map<String, dynamic> _$UserPrivacyToJson(UserPrivacy instance) =>
    <String, dynamic>{
      'show_social_list': instance.showSocialList,
      'show_online_status': instance.showOnlineStatus,
    };

UserRank _$UserRankFromJson(Map<String, dynamic> json) => UserRank(
  rankName: json['rank_name'] as String,
  colorHex: json['rank_color_hex'] as String,
);

Map<String, dynamic> _$UserRankToJson(UserRank instance) => <String, dynamic>{
  'rank_name': instance.rankName,
  'rank_color_hex': instance.colorHex,
};
