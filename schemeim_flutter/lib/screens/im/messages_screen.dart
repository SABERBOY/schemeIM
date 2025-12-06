import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../providers/user_provider.dart';
import 'chat_detail_screen.dart';
import 'ai_chat_screen.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).currentUser;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A3A),
                  borderRadius: BorderRadius.circular(8),
                  border: const Border(left: BorderSide(color: Color(0xFF2196F3), width: 4)),
                ),
                child: const Row(
                  children: [
                    CircleAvatar(backgroundColor: Color(0xFF2196F3), radius: 4),
                    SizedBox(width: 10),
                    Text("RongCloud IM Connected", style: TextStyle(color: Colors.grey, fontSize: 14)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text("Messages", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),

              // AI Chat Row
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => AIChatScreen(currentUser: user)));
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppTheme.surface,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 50, height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(colors: [Color(0xFF6200EA), Color(0xFFB388FF)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                        ),
                        child: const Icon(Icons.smart_toy, color: Colors.white, size: 28),
                      ),
                      const SizedBox(width: 15),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("AI Assistant", style: TextStyle(color: AppTheme.secondary, fontWeight: FontWeight.bold)),
                            SizedBox(height: 4),
                            Text("Ask me anything...", style: TextStyle(color: Colors.grey, fontSize: 14)),
                          ],
                        ),
                      ),
                      const Text("Now", style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Mock Chats
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF333333)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListView.separated(
                    itemCount: MOCK_CHATS.length,
                    separatorBuilder: (_, __) => const Divider(color: Color(0xFF333333), height: 1),
                    itemBuilder: (context, index) {
                      final chat = MOCK_CHATS[index];
                      return ListTile(
                        onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (_) => ChatDetailScreen(contact: chat)));
                        },
                        contentPadding: const EdgeInsets.all(15),
                        tileColor: AppTheme.surface,
                        leading: SizedBox(
                          width: 50, height: 50,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(int.parse(chat.avatar.replaceFirst('#', '0xFF'))),
                                ),
                              ),
                              if (chat.frame != null && chat.frame!.isNotEmpty)
                                Positioned(
                                  top: -5, left: -5, right: -5, bottom: -5,
                                  child: SvgPicture.string(chat.frame!, fit: BoxFit.fill),
                                ),
                            ],
                          ),
                        ),
                        title: Text(chat.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        subtitle: Text(chat.lastMessage, style: const TextStyle(color: Colors.grey), maxLines: 1, overflow: TextOverflow.ellipsis),
                        trailing: Text(chat.time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

