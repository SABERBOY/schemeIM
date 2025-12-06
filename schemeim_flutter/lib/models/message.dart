class Message {
  final String id;
  final String userId;
  final String userName;
  final String content;
  final String type; // 'text' | 'gift'
  final String? giftName;
  final String? giftIcon;
  final Map<String, int>? reactions;

  Message({
    required this.id,
    required this.userId,
    required this.userName,
    required this.content,
    required this.type,
    this.giftName,
    this.giftIcon,
    this.reactions,
  });

  Message copyWith({
    String? id,
    String? userId,
    String? userName,
    String? content,
    String? type,
    String? giftName,
    String? giftIcon,
    Map<String, int>? reactions,
  }) {
    return Message(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      content: content ?? this.content,
      type: type ?? this.type,
      giftName: giftName ?? this.giftName,
      giftIcon: giftIcon ?? this.giftIcon,
      reactions: reactions ?? this.reactions,
    );
  }
}

