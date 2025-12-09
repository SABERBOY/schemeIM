import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/room.dart';
import '../../constants.dart';
import '../../providers/user_provider.dart';
import '../../services/api_service.dart';
import 'social_graph_screen.dart';
import '../room/voice_room_screen.dart';

class LobbyScreen extends StatefulWidget {
  const LobbyScreen({super.key});

  @override
  State<LobbyScreen> createState() => _LobbyScreenState();
}

class _LobbyScreenState extends State<LobbyScreen> {
  List<Room> _rooms = [];
  bool _showMap = false;

  @override
  void initState() {
    super.initState();
    _fetchRooms();
  }

  Future<void> _fetchRooms() async {
    final rooms = await ApiService.room.list();
    setState(() {
      _rooms = rooms;
    });
  }

  void _joinRoom(Room room) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => VoiceRoomScreen(room: room)),
    );
  }

  void _createRoom(String title, String country) {
    final user = Provider.of<UserProvider>(context, listen: false).currentUser;
    final newRoom = Room(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      countryFlag: country,
      host: user,
      seats: [],
      onlineCount: 1,
      tags: ['New', 'Chat'],
    );
    setState(() {
      _rooms.insert(0, newRoom);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);

    if (_showMap) {
      return SocialGraphScreen(onClose: () => setState(() => _showMap = false));
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          provider.t('activeRooms'),
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.public, color: AppTheme.secondary),
            onPressed: () => setState(() => _showMap = true),
          ),
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: ElevatedButton.icon(
              onPressed: () => _showCreateDialog(context, provider),
              icon: const Icon(Icons.add, color: Colors.black, size: 16),
              label: Text(
                provider.t('create'),
                style: const TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.4,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: _rooms.length,
        itemBuilder: (context, index) {
          final room = _rooms[index];
          return _RoomCard(room: room, onTap: () => _joinRoom(room));
        },
      ),
    );
  }

  void _showCreateDialog(BuildContext context, UserProvider provider) {
    String title = '';
    String country = '🇦🇪';
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: AppTheme.surface,
            title: Text(
              provider.t('createRoom'),
              style: const TextStyle(color: Colors.white),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (v) => title = v,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: provider.t('roomTitle'),
                    hintStyle: const TextStyle(color: Colors.grey),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: ['🇦🇪', '🇸🇦', '🇶🇦', '🇪🇬']
                      .map(
                        (c) => GestureDetector(
                          onTap: () => setState(() => country = c),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: country == c
                                    ? AppTheme.secondary
                                    : Colors.transparent,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              c,
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(provider.t('cancel')),
              ),
              ElevatedButton(
                onPressed: () {
                  if (title.isNotEmpty) {
                    _createRoom(title, country);
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.secondary,
                ),
                child: Text(
                  provider.t('create'),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _RoomCard extends StatelessWidget {
  final Room room;
  final VoidCallback onTap;

  const _RoomCard({required this.room, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF311B92),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                    ),
                    width: double.infinity,
                  ),
                  Positioned(
                    top: 8,
                    left: 8, // LTR/RTL handled by directionality if wrapped, but here hardcoded. 
                             // Ideally use directional positioned or context direction check.
                    child: Text(
                      room.countryFlag,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "👥 ${room.onlineCount}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundImage: NetworkImage(room.host.avatarUrl),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            room.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 2),
                          if (room.tags.isNotEmpty)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 1,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                room.tags.first,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 8,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
