import 'package:flutter/material.dart';
import 'package:tecnar_video/config/theme/app_theme.dart';
import 'package:tecnar_video/presentation/widgets/video/fullscreen_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Player',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: const VideoHomeScreen(),
    );
  }
}

class VideoHomeScreen extends StatefulWidget {
  const VideoHomeScreen({super.key});

  @override
  State<VideoHomeScreen> createState() => _VideoHomeScreenState();
}

class _VideoHomeScreenState extends State<VideoHomeScreen> {
  final ScrollController _scrollController = ScrollController();

  static const videoPosts = [
    {
      'name': 'Subiendo escaleras automáticas',
      'videoUrl': 'assets/videos/1.mp4',
      'likes': 23230,
      'views': 1523,
    },
    {
      'name': 'Planta apreciada por peatones',
      'videoUrl': 'assets/videos/2.mp4',
      'likes': 24230,
      'views': 1343,
    },
    {
      'name': 'Que borroso veo todo!',
      'videoUrl': 'assets/videos/3.mp4',
      'likes': 21564320,
      'views': 123563,
    },
    {
      'name': '¿Esto es trigo? que interesante',
      'videoUrl': 'assets/videos/4.mp4',
      'likes': 320,
      'views': 2300,
    },
    {
      'name': 'El COVID no me afecta',
      'videoUrl': 'assets/videos/5.mp4',
      'likes': 3230,
      'views': 31030,
    },
    {
      'name': 'No quiero ir a trabajar hoy señor Stark',
      'videoUrl': 'assets/videos/6.mp4',
      'likes': 10,
      'views': 330,
    },
    {
      'name': 'Limpiar nunca fue tan divertido',
      'videoUrl': 'assets/videos/7.mp4',
      'likes': 1320,
      'views': 33032,
    },
    {
      'name': '¿Ya llegamos a la India?... umm si',
      'videoUrl': 'assets/videos/8.mp4',
      'likes': 342,
      'views': 3332,
    },
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _scrollToIndex(int index) async {
    final position = index * 120.0;
    await _scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF121212), Color(0xFF1F1F2B)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Text(
                'Discover your next video',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Tap a card to open the fullscreen player.',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: videoPosts.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final item = videoPosts[index];
                  return GestureDetector(
                    onTap: () async {
                      final navigator = Navigator.of(context);
                      final videoUrl = item['videoUrl'] as String;
                      final caption = item['name'] as String;
                      await _scrollToIndex(index);
                      if (!mounted) return;
                      navigator.push(
                        MaterialPageRoute(
                          builder: (_) => FullscreenPlayer(
                            videoUrl: videoUrl,
                            caption: caption,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E1E2E),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.white12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(18),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 72,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: const LinearGradient(
                                colors: [Color(0xFF283048), Color(0xFF859398)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Icon(
                                    Icons.play_circle_outline,
                                    size: 40,
                                    color: Colors.white.withOpacity(0.85),
                                  ),
                                ),
                                Positioned(
                                  left: 10,
                                  bottom: 8,
                                  child: Text(
                                    'THUMB',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.85),
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'] as String,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  '${item['views']} views • ${item['likes']} likes',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right, color: Colors.white70),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
