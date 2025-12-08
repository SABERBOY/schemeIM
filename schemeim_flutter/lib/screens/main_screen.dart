import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../providers/user_provider.dart';
import 'home/lobby_screen.dart';
import 'games/game_center_screen.dart';
import 'studio/image_studio_screen.dart';
import 'im/messages_screen.dart';
import 'profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // We will replace these with actual screens later
  final List<Widget> _screens = [
    const LobbyScreen(),
    const GameCenterScreen(),
    const ImageStudioScreen(),
    const MessagesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);
    
    return Scaffold(
      backgroundColor: AppTheme.bg,
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFF333333))),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          backgroundColor: AppTheme.surface,
          selectedItemColor: AppTheme.secondary,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          items: [
            BottomNavigationBarItem(icon: const Icon(Icons.home), label: provider.t('home')),
            BottomNavigationBarItem(icon: const Icon(Icons.games), label: provider.t('games')),
            BottomNavigationBarItem(icon: const Icon(Icons.auto_fix_high), label: provider.t('studio')),
            BottomNavigationBarItem(icon: const Icon(Icons.chat_bubble), label: provider.t('im')),
            BottomNavigationBarItem(icon: const Icon(Icons.person), label: provider.t('me')),
          ],
        ),
      ),
    );
  }
}
