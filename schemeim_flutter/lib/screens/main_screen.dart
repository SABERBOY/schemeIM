import 'package:flutter/material.dart';
import '../constants.dart';
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
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.games), label: 'Games'),
            BottomNavigationBarItem(icon: Icon(Icons.auto_fix_high), label: 'Studio'),
            BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'IM'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
          ],
        ),
      ),
    );
  }
}

