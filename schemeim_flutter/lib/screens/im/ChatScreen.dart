import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rongcloud_im_kit/rongcloud_im_kit.dart';

class ChatScreen extends StatefulWidget {
  final RCIMIWConversation conversation;
  const ChatScreen({super.key, required this.conversation});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late RCKEngineProvider _engineProvider;
  late VoidCallback _onReceiveMessage;

  @override
  void initState() {
    super.initState();
    // 延后到首帧后再读取 context
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _engineProvider = context.read<RCKEngineProvider>();
      _onReceiveMessage = () {
        final msg = _engineProvider.receiveMessageNotifier.value;
        if (msg == null) return;
        // 在此处编写自定义逻辑（示例）
        // playSound();  sendLocalAnalytics(msg);  showInAppBanner(msg);
      };
      _engineProvider.receiveMessageNotifier.addListener(_onReceiveMessage);
    });
  }

  @override
  void dispose() {
    // 移除监听，避免内存泄漏
    try {
      _engineProvider.receiveMessageNotifier.removeListener(_onReceiveMessage);
    } catch (_) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RCKChatPage(conversation: widget.conversation);
  }
}