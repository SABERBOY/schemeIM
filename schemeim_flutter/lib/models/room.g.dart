// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  countryFlag: json['country_flag'] as String,
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  host: User.fromJson(json['host'] as Map<String, dynamic>),
  seats: (json['seats'] as List<dynamic>)
      .map((e) => RoomSeat.fromJson(e as Map<String, dynamic>))
      .toList(),
  onlineCount: (json['online_count'] as num).toInt(),
);

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'country_flag': instance.countryFlag,
  'tags': instance.tags,
  'host': instance.host,
  'seats': instance.seats,
  'online_count': instance.onlineCount,
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

ChatRoomCreateRequest _$ChatRoomCreateRequestFromJson(
  Map<String, dynamic> json,
) => ChatRoomCreateRequest(
  chatroom_id: json['chatroom_id'] as String,
  name: json['name'] as String,
  host_id: json['host_id'] as String,
  tags: json['tags'] as String,
  country_flag: json['country_flag'] as String,
  description: json['description'] as String,
  destroy_type: (json['destroy_type'] as num).toInt(),
  destroy_time: (json['destroy_time'] as num).toInt(),
  is_ban: json['is_ban'] as bool,
  white_user_ids: (json['white_user_ids'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  need_notify: json['need_notify'] as bool,
  extra: json['extra'] as String,
);

Map<String, dynamic> _$ChatRoomCreateRequestToJson(
  ChatRoomCreateRequest instance,
) => <String, dynamic>{
  'chatroom_id': instance.chatroom_id,
  'name': instance.name,
  'host_id': instance.host_id,
  'tags': instance.tags,
  'country_flag': instance.country_flag,
  'description': instance.description,
  'destroy_type': instance.destroy_type,
  'destroy_time': instance.destroy_time,
  'is_ban': instance.is_ban,
  'white_user_ids': instance.white_user_ids,
  'need_notify': instance.need_notify,
  'extra': instance.extra,
};

ChatRoomCreateResponse _$ChatRoomCreateResponseFromJson(
  Map<String, dynamic> json,
) => ChatRoomCreateResponse(
  chatroom_id: json['chatroom_id'] as String,
  message: json['message'] as String,
);

Map<String, dynamic> _$ChatRoomCreateResponseToJson(
  ChatRoomCreateResponse instance,
) => <String, dynamic>{
  'chatroom_id': instance.chatroom_id,
  'message': instance.message,
};
