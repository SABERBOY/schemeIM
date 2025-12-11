import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rongcloud_im_kit/rongcloud_im_kit.dart';

class ConversationListScreen extends StatelessWidget {
  const ConversationListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('会话列表'),
      ),
      body: RCKConvoPage(
        onItemTap: (context, conversation, index) {
          // 跳转到聊天页面
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RCKChatPage(
                conversation: conversation,
              ),
            ),
          );
        },
        onItemLongPress: (context, conversation, index) {
          final engineProvider = context.read<RCKEngineProvider>();
          final conversationProvider = context.read<RCKConvoProvider>();

          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Wrap(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('删除会话'),
                    onTap: () {
                      Navigator.pop(context);
                      // 删除会话
                      conversationProvider.removeConversation(index);
                    },
                  ),
                  ListTile(
                    leading: Icon(conversation.top ?? false ? Icons.push_pin_outlined : Icons.push_pin),
                    title: Text(conversation.top ?? false ? '取消置顶' : '置顶会话'),
                    onTap: () {
                      Navigator.pop(context);
                      // 置顶或取消置顶
                      conversationProvider.pinConversation(index);
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}