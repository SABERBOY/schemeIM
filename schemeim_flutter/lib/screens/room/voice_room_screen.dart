import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../models/room.dart';
import '../../models/user.dart';
import '../../models/message.dart';
import '../../constants.dart';
import '../../providers/user_provider.dart';

class VoiceRoomScreen extends StatefulWidget {
  final Room room;
  const VoiceRoomScreen({super.key, required this.room});

  @override
  State<VoiceRoomScreen> createState() => _VoiceRoomScreenState();
}

class _VoiceRoomScreenState extends State<VoiceRoomScreen> {
  bool _micOn = false;
  final List<Message> _messages = [];
  final TextEditingController _inputController = TextEditingController();
  bool _showGifts = false;
  bool _showQuickReplies = false;
  Gift? _giftAnimation;
  final ScrollController _scrollController = ScrollController();

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;
    final user = Provider.of<UserProvider>(context, listen: false).currentUser;
    setState(() {
      _messages.add(Message(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        userId: user.id,
        userName: user.name,
        content: text,
        type: 'text',
      ));
      _inputController.clear();
      _showQuickReplies = false;
    });
    _scrollToBottom();
  }

  void _sendGift(Gift gift) {
    final provider = Provider.of<UserProvider>(context, listen: false);
    final user = provider.currentUser;

    if (user.gold < gift.cost) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Not enough gold!")));
      return;
    }

    provider.updateUser(user.copyWith(gold: user.gold - gift.cost));

    setState(() {
      _giftAnimation = gift;
      _messages.add(Message(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        userId: user.id,
        userName: user.name,
        content: "Sent a ${gift.name}",
        type: 'gift',
        giftName: gift.name,
        giftIcon: gift.icon,
      ));
      _showGifts = false;
    });
    _scrollToBottom();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => _giftAnimation = null);
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).currentUser;

    return Scaffold(
      resizeToAvoidBottomInset: true, // Allow chat to move up
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF311B92), Color(0xFF121212)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  _buildHeader(context),
                  _buildSeats(widget.room),
                  Expanded(child: _buildChat()),
                  if (_showQuickReplies) _buildQuickReplies(),
                  _buildBottomBar(user),
                ],
              ),
            ),
          ),
          if (_showGifts) _buildGiftPanel(user),
          if (_giftAnimation != null) _buildGiftAnimation(),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          Text(
            "${widget.room.country} ${widget.room.title}",
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Row(
            children: [
              IconButton(icon: const Icon(Icons.people, color: Colors.white), onPressed: () {}),
              IconButton(icon: const Icon(Icons.settings, color: Colors.white), onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSeats(Room room) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 250, // Fixed height for seats grid
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.8,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: 9, // Host + 8 guests
        itemBuilder: (context, index) {
          if (index == 0) return _buildSeat(room.host, isHost: true);
          return _buildEmptySeat(index);
        },
      ),
    );
  }

  Widget _buildSeat(User user, {bool isHost = false}) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 60, height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppTheme.secondary, width: 2),
                image: DecorationImage(image: NetworkImage(user.avatar), fit: BoxFit.cover),
              ),
            ),
            if (user.frame != null && user.frame!.isNotEmpty)
              Positioned(
                top: -10, left: -10, right: -10, bottom: -10,
                child: SvgPicture.string(user.frame!, fit: BoxFit.fill),
              ),
            if (isHost)
              Positioned(
                bottom: -5, right: -5,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(color: AppTheme.secondary, shape: BoxShape.circle),
                  child: const Text("👑", style: TextStyle(fontSize: 10)),
                ),
              ),
          ],
        ),
        const SizedBox(height: 5),
        Text(user.name, style: const TextStyle(color: Colors.white, fontSize: 12), overflow: TextOverflow.ellipsis),
      ],
    );
  }

  Widget _buildEmptySeat(int index) {
    return Column(
      children: [
        Container(
          width: 55, height: 55,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withOpacity(0.3),
            border: Border.all(color: Colors.white.withOpacity(0.3)),
          ),
          child: Icon(Icons.mic_off, size: 16, color: Colors.white.withOpacity(0.5)),
        ),
        const SizedBox(height: 5),
        Text("${index}", style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12)),
      ],
    );
  }

  Widget _buildChat() {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final msg = _messages[index];
        final isGift = msg.type == 'gift';
        return Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: isGift ? const Color(0xFFFFD700).withOpacity(0.2) : Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
              border: isGift ? Border.all(color: AppTheme.secondary) : null,
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: "${msg.userName}: ", style: const TextStyle(color: AppTheme.secondary, fontWeight: FontWeight.bold, fontSize: 14)),
                  TextSpan(
                    text: "${msg.content} ${msg.giftIcon ?? ''}",
                    style: TextStyle(color: isGift ? AppTheme.secondary : Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildQuickReplies() {
    return Container(
      height: 50,
      color: Colors.black.withOpacity(0.8),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        itemCount: QUICK_REPLIES.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _sendMessage(QUICK_REPLIES[index]),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: Text(QUICK_REPLIES[index], style: const TextStyle(color: Colors.white)),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomBar(User user) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: AppTheme.surface,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: _micOn ? AppTheme.success : Colors.white.withOpacity(0.1),
            child: IconButton(
              icon: Icon(_micOn ? Icons.mic : Icons.mic_off, color: Colors.white),
              onPressed: () => setState(() => _micOn = !_micOn),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _inputController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Say something...",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      onSubmitted: _sendMessage,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.bolt, color: _showQuickReplies ? AppTheme.secondary : Colors.white),
                    onPressed: () => setState(() => _showQuickReplies = !_showQuickReplies),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: const Color(0xFFFFEBEE),
            child: IconButton(
              icon: const Text("🌹", style: TextStyle(fontSize: 20)),
              onPressed: () => _sendGift(GIFTS[0]),
            ),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: AppTheme.secondary,
            child: IconButton(
              icon: const Icon(Icons.card_giftcard, color: Colors.black),
              onPressed: () => setState(() => _showGifts = !_showGifts),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGiftPanel(User user) {
    return Positioned(
      bottom: 0, left: 0, right: 0,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Send Gift", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text("💰 ${user.gold}", style: const TextStyle(color: AppTheme.secondary)),
              ],
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: GIFTS.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final gift = GIFTS[index];
                  return GestureDetector(
                    onTap: () => _sendGift(gift),
                    child: Container(
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(gift.icon, style: const TextStyle(fontSize: 30)),
                          Text(gift.name, style: const TextStyle(color: Colors.white, fontSize: 10)),
                          Text("${gift.cost}", style: const TextStyle(color: AppTheme.secondary, fontSize: 10)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white.withOpacity(0.1)),
                onPressed: () => setState(() => _showGifts = false),
                child: const Text("Cancel", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGiftAnimation() {
    return Positioned.fill(
      child: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 500),
          curve: Curves.elasticOut,
          builder: (context, double value, child) {
            return Transform.scale(
              scale: value,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(_giftAnimation!.icon, style: const TextStyle(fontSize: 100, decoration: TextDecoration.none)),
                  Text(_giftAnimation!.name, style: const TextStyle(color: AppTheme.secondary, fontSize: 30, fontWeight: FontWeight.bold, decoration: TextDecoration.none, shadows: [Shadow(blurRadius: 10, color: Colors.black)])),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

