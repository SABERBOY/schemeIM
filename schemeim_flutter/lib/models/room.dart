import 'user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'room.g.dart';

@JsonSerializable()
class Room {
  final String id;
  final String title;
  final String? description;
  final String countryFlag;
  final List<String> tags;
  final User host;
  final List<RoomSeat> seats;
  final int onlineCount;

  Room({
    required this.id,
    required this.title,
    this.description,
    required this.countryFlag,
    required this.tags,
    required this.host,
    required this.seats,
    required this.onlineCount,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}

@JsonSerializable()
class RoomSeat {
  final int index;
  final String? userId;
  final User? user;
  final bool isMuted;
  final bool isLocked;

  RoomSeat({
    required this.index,
    this.userId,
    this.user,
    required this.isMuted,
    required this.isLocked,
  });

  factory RoomSeat.fromJson(Map<String, dynamic> json) =>
      _$RoomSeatFromJson(json);

  Map<String, dynamic> toJson() => _$RoomSeatToJson(this);
}

/* 
// ChatRoomCreateRequest 创建聊天室请求
type ChatRoomCreateRequest struct {
	ChatRoomID   string   `json:"chatroom_id" binding:"required"`
	Name         string   `json:"name" binding:"required"`
	HostID       string   `json:"host_id,omitempty"`        // 房主ID
	Tags         string   `json:"tags,omitempty"`           // 标签
	CountryFlag  string   `json:"country_flag,omitempty"`   // 国旗
	Description  string   `json:"description,omitempty"`    // 描述
	DestroyType  int      `json:"destroy_type,omitempty"`   // 0: 默认，1: 定时销毁
	DestroyTime  int      `json:"destroy_time,omitempty"`   // 分钟数，最大10080分钟
	IsBan        bool     `json:"is_ban,omitempty"`         // 是否禁言所有成员
	WhiteUserIds []string `json:"white_user_ids,omitempty"` // 禁言白名单用户ID
	NeedNotify   bool     `json:"need_notify,omitempty"`    // 是否通知成员
	Extra        string   `json:"extra,omitempty"`          // 通知扩展信息
}
 */
@JsonSerializable()
class ChatRoomCreateRequest {
  final String chatroom_id;
  final String name;
  final String host_id;
  final String tags;
  final String country_flag;
  final String description;
  final int destroy_type;
  final int destroy_time;
  final bool is_ban;
  final List<String> white_user_ids;
  final bool need_notify;
  final String extra;

  ChatRoomCreateRequest({
    required this.chatroom_id,
    required this.name,
    required this.host_id,
    required this.tags,
    required this.country_flag,
    required this.description,
    required this.destroy_type,
    required this.destroy_time,
    required this.is_ban,
    required this.white_user_ids,
    required this.need_notify,
    required this.extra,
  });
  factory ChatRoomCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomCreateRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ChatRoomCreateRequestToJson(this);
}

@JsonSerializable()
class ChatRoomCreateResponse {
  final String chatroom_id;
  final String message;

  ChatRoomCreateResponse({required this.chatroom_id, required this.message});
  factory ChatRoomCreateResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomCreateResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ChatRoomCreateResponseToJson(this);
}
