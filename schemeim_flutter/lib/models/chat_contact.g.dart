// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatContact _$ChatContactFromJson(Map<String, dynamic> json) => ChatContact(
  id: json['id'] as String,
  name: json['name'] as String,
  avatar: json['avatar'] as String,
  frame: json['frame'] as String?,
  lastMessage: json['lastMessage'] as String,
  time: json['time'] as String,
  isAi: json['isAi'] as bool?,
);

Map<String, dynamic> _$ChatContactToJson(ChatContact instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'frame': instance.frame,
      'lastMessage': instance.lastMessage,
      'time': instance.time,
      'isAi': instance.isAi,
    };
