import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../../constants.dart';

class ImageStudioScreen extends StatefulWidget {
  const ImageStudioScreen({super.key});

  @override
  State<ImageStudioScreen> createState() => _ImageStudioScreenState();
}

class _ImageStudioScreenState extends State<ImageStudioScreen> {
  String _prompt = '';
  Uint8List? _selectedImageBytes;
  Uint8List? _generatedImageBytes;
  bool _loading = false;
  final TextEditingController _promptController = TextEditingController();

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final bytes = await image.readAsBytes();
      setState(() {
        _selectedImageBytes = bytes;
        _generatedImageBytes = null;
      });
    }
  }

  Future<void> _generateImage() async {
    // In a real app, use --dart-define or .env file.
    // For this demo, we check environment or constant.
    const apiKey = String.fromEnvironment('API_KEY');
    
    if (apiKey.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("API Key missing. Use --dart-define=API_KEY=...")));
      return;
    }

    if (_prompt.isEmpty || _selectedImageBytes == null) return;

    setState(() => _loading = true);

    try {
      final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey); // Using 1.5 Flash as standard available model
      // Note: Actual Image Generation model availability via API might vary.
      // The user's React code used 'gemini-2.5-flash-image'.
      
      final content = [
        Content.multi([
          TextPart(_prompt),
          DataPart('image/jpeg', _selectedImageBytes!),
        ])
      ];

      final response = await model.generateContent(content);
      
      // Logic to extract image if returned as DataPart
      bool foundImage = false;
      if (response.candidates.isNotEmpty) {
        for (final part in response.candidates.first.content.parts) {
          if (part is DataPart) {
             setState(() => _generatedImageBytes = part.bytes);
             foundImage = true;
             break;
          }
        }
      }

      if (!foundImage) {
         if (response.text != null) {
            // If text returned instead of image
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Model returned text: ${response.text!.substring(0, min(50, response.text!.length))}...")));
         } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No image generated.")));
         }
      }

    } catch (e) {
      print("Generation Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Generation failed.")));
    } finally {
      setState(() => _loading = false);
    }
  }

  // Helper for min since math is not imported
  int min(int a, int b) => a < b ? a : b;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.auto_fix_high, color: AppTheme.secondary, size: 28),
                  SizedBox(width: 10),
                  Text("AI Studio", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 20),
              
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Preview Area
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          color: AppTheme.surface,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: const Color(0xFF333333)),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            if (_selectedImageBytes == null)
                              GestureDetector(
                                onTap: _pickImage,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.add, size: 48, color: Color(0xFF555555)),
                                    const SizedBox(height: 10),
                                    Text("Tap to Upload Image", style: TextStyle(color: Colors.grey[600])),
                                  ],
                                ),
                              )
                            else
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          const Text("Original", style: TextStyle(color: Colors.grey, fontSize: 12)),
                                          const SizedBox(height: 5),
                                          Expanded(child: Image.memory(_selectedImageBytes!, fit: BoxFit.contain)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (_generatedImageBytes != null)
                                    Expanded(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          border: Border(left: BorderSide(color: Color(0xFF333333))),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            const Text("AI Edited", style: TextStyle(color: AppTheme.secondary, fontSize: 12)),
                                            const SizedBox(height: 5),
                                            Expanded(child: Image.memory(_generatedImageBytes!, fit: BoxFit.contain)),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),

                            if (_loading)
                              Container(
                                color: Colors.black.withOpacity(0.7),
                                child: const Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("✨", style: TextStyle(fontSize: 30)),
                                      SizedBox(height: 10),
                                      Text("Magic in progress...", style: TextStyle(color: AppTheme.secondary)),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      
                      if (_selectedImageBytes != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: OutlinedButton(
                            onPressed: _pickImage,
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.grey),
                              foregroundColor: Colors.grey,
                            ),
                            child: const Text("Change Image"),
                          ),
                        ),

                      const SizedBox(height: 20),

                      // Controls
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppTheme.surface,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("How should AI change this image?", style: TextStyle(color: Colors.white)),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _promptController,
                                    onChanged: (v) => setState(() => _prompt = v),
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: "e.g., Add a retro filter...",
                                      hintStyle: const TextStyle(color: Colors.grey),
                                      filled: true,
                                      fillColor: const Color(0xFF333333),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: (_selectedImageBytes == null || _prompt.trim().isEmpty || _loading) ? null : _generateImage,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppTheme.secondary,
                                    disabledBackgroundColor: Colors.grey[800],
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  ),
                                  child: const Text("Go", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: ["Add a neon glow", "Make it sketch style", "Make it vintage", "Add fireworks"].map((p) => 
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: ActionChip(
                                      label: Text(p, style: const TextStyle(color: Color(0xFFCCCCCC), fontSize: 12)),
                                      backgroundColor: Colors.white.withOpacity(0.1),
                                      onPressed: () {
                                        setState(() => _prompt = p);
                                        _promptController.text = p;
                                      },
                                    ),
                                  )
                                ).toList(),
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
      ),
    );
  }
}

