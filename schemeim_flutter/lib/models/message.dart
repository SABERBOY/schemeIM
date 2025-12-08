enum MessageType {
  text,
  gift,
  system,
}

class Message {
  final String id;
  final String senderId;
  final String senderName;
  final String content;
  final String timestamp;
  final MessageType type;
  final String? giftName;
  final String? giftIcon;
  final Map<String, int>? reactions;

  Message({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.content,
    required this.timestamp,
    required this.type,
    this.giftName,
    this.giftIcon,
    this.reactions,
  });

  Message copyWith({
    String? id,
    String? senderId,
    String? senderName,
    String? content,
    String? timestamp,
    MessageType? type,
    String? giftName,
    String? giftIcon,
    Map<String, int>? reactions,
  }) {
    return Message(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      type: type ?? this.type,
      giftName: giftName ?? this.giftName,
      giftIcon: giftIcon ?? this.giftIcon,
      reactions: reactions ?? this.reactions,
    );
  }
}
