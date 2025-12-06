import 'package:flutter/material.dart';
import '../../constants.dart';

class GameCenterScreen extends StatefulWidget {
  const GameCenterScreen({super.key});

  @override
  State<GameCenterScreen> createState() => _GameCenterScreenState();
}

class _GameCenterScreenState extends State<GameCenterScreen> {
  GameItem? _activeGame;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Handled by MainScreen or wrapper
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_activeGame == null)
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text("Game Center", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                ),
              Expanded(
                child: _activeGame != null ? _buildGameView() : _buildGameList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGameList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.8,
      ),
      itemCount: GAMES.length,
      itemBuilder: (context, index) {
        final game = GAMES[index];
        return GestureDetector(
          onTap: () => setState(() => _activeGame = game),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.surface,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60, height: 60,
                  decoration: BoxDecoration(
                    color: game.color,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Text(game.icon, style: const TextStyle(fontSize: 30)),
                ),
                const SizedBox(height: 10),
                Text(game.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                const Text("Play Now", style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildGameView() {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => setState(() => _activeGame = null),
            ),
            const SizedBox(width: 10),
            Text(_activeGame!.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_activeGame!.icon, style: const TextStyle(fontSize: 80, decoration: TextDecoration.none)),
                const SizedBox(height: 20),
                Text("Loading ${_activeGame!.name}...", style: const TextStyle(color: Colors.black, fontSize: 18, decoration: TextDecoration.none)),
                const SizedBox(height: 10),
                const Text("Simulating HTML5 Game Webview", style: TextStyle(color: Colors.grey, fontSize: 14, decoration: TextDecoration.none)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

