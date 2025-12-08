import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../../constants.dart';
import '../../models/user.dart';

class AIChatScreen extends StatefulWidget {
  final User currentUser;
  const AIChatScreen({super.key, required this.currentUser});

  @override
  State<AIChatScreen> createState() => _AIChatScreenState();
}

class _AIChatScreenState extends State<AIChatScreen> {
  // We keep history in Gemini format
  final List<Content> _history = [];
  // We keep UI messages for display (simpler structure)
  final List<Map<String, String>> _messages = [];
  final TextEditingController _controller = TextEditingController();
  bool _loading = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _messages.add({'role': 'model', 'text': 'Salam ${widget.currentUser.name}! I am your AI Assistant. How can I help you today?'});
  }

  Future<void> _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty || _loading) return;

    setState(() {
      _messages.add({'role': 'user', 'text': text});
      _loading = true;
      _controller.clear();
    });
    _scrollToBottom();

    try {
      const apiKey = String.fromEnvironment('API_KEY');
      if (apiKey.isEmpty) {
        throw Exception("API Key missing. Use --dart-define=API_KEY=...");
      }

      final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
      final chat = model.startChat(history: _history);
      final response = await chat.sendMessage(Content.text(text));

      setState(() {
        // Sync history manually if startChat doesn't persist across rebuilds in this logic 
        // (startChat returns a session, we should probably keep session in state, but simpler here)
        // Actually, startChat(history: _history) creates a NEW session with PAST history.
        // We need to update _history.
        _history.add(Content.text(text));
        
        if (response.text != null) {
          _history.add(Content.model([TextPart(response.text!)]));
          _messages.add({'role': 'model', 'text': response.text!});
        }
      });
    } catch (e) {
      setState(() {
        _messages.add({'role': 'model', 'text': "Error: $e"});
      });
    } finally {
      setState(() => _loading = false);
      _scrollToBottom();
    }
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
    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: AppBar(
        backgroundColor: AppTheme.surface,
        leading: IconButton(icon: const Icon(Icons.close, color: Colors.white), onPressed: () => Navigator.pop(context)),
        title: Row(
          children: [
            Container(
              width: 32, height: 32,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [Color(0xFFFFD700), Color(0xFFFF5722)], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: const Icon(Icons.smart_toy, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 10),
            const Text("AI Assistant", style: TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(15),
              itemCount: _messages.length + (_loading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == _messages.length) {
                  return const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 10),
                    child: Text("AI is typing...", style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)),
                  );
                }
                final msg = _messages[index];
                final isUser = msg['role'] == 'user';
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
                    decoration: BoxDecoration(
                      color: isUser ? AppTheme.primary : AppTheme.surface,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(msg['text']!, style: const TextStyle(color: Colors.white)),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            color: AppTheme.surface,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Ask me anything...",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: const Color(0xFF333333),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide.none),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: AppTheme.secondary,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.black),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

