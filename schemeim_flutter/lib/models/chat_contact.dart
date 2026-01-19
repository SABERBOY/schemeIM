import 'package:json_annotation/json_annotation.dart';
part 'chat_contact.g.dart';

@JsonSerializable()
class ChatContact {
  final String id;
  final String name;
  final String avatar;
  final String? frame;
  final String lastMessage;
  final String time;
  final bool? isAi;

  ChatContact({
    required this.id,
    required this.name,
    required this.avatar,
    this.frame,
    required this.lastMessage,
    required this.time,
    this.isAi,
  });

  factory ChatContact.fromJson(Map<String, dynamic> json) =>
      _$ChatContactFromJson(json);

  Map<String, dynamic> toJson() => _$ChatContactToJson(this);
}
