// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  countryFlag: json['countryFlag'] as String,
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  host: User.fromJson(json['host'] as Map<String, dynamic>),
  seats: (json['seats'] as List<dynamic>)
      .map((e) => RoomSeat.fromJson(e as Map<String, dynamic>))
      .toList(),
  onlineCount: (json['onlineCount'] as num).toInt(),
);

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'countryFlag': instance.countryFlag,
  'tags': instance.tags,
  'host': instance.host,
  'seats': instance.seats,
  'onlineCount': instance.onlineCount,
};

RoomSeat _$RoomSeatFromJson(Map<String, dynamic> json) => RoomSeat(
  index: (json['index'] as num).toInt(),
  userId: json['userId'] as String?,
  user: json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>),
  isMuted: json['isMuted'] as bool,
  isLocked: json['isLocked'] as bool,
);

Map<String, dynamic> _$RoomSeatToJson(RoomSeat instance) => <String, dynamic>{
  'index': instance.index,
  'userId': instance.userId,
  'user': instance.user,
  'isMuted': instance.isMuted,
  'isLocked': instance.isLocked,
};
