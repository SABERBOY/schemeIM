// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
  id: json['id'] as String,
  senderId: json['senderId'] as String,
  senderName: json['senderName'] as String,
  content: json['content'] as String,
  timestamp: json['timestamp'] as String,
  type: $enumDecode(_$MessageTypeEnumMap, json['type']),
  giftName: json['giftName'] as String?,
  giftIcon: json['giftIcon'] as String?,
  reactions: (json['reactions'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num).toInt()),
  ),
);

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
  'id': instance.id,
  'senderId': instance.senderId,
  'senderName': instance.senderName,
  'content': instance.content,
  'timestamp': instance.timestamp,
  'type': _$MessageTypeEnumMap[instance.type]!,
  'giftName': instance.giftName,
  'giftIcon': instance.giftIcon,
  'reactions': instance.reactions,
};

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.gift: 'gift',
  MessageType.system: 'system',
};
