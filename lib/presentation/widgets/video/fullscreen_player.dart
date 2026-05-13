


import 'package:flutter/material.dart';

class FullscreenPlayer extends StatefulWidget {

    final String videoUrl;
    final String caption;

  const FullscreenPlayer({
    super.key,
    required this.videoUrl,
    required this.caption
  });

  @override
  State<FullscreenPlayer> createState() => _FullscreenPlayerState();
}

class _FullscreenPlayerState extends State<FullscreenPlayer> {
  late VideoPlayerController _controller;

@override
void initState() {
  super.initState();
  controller = VideoPlayerController.asset(widget.videoUrl)
  ..setVolume(0)
  ..setLooping(true)
  ..play();
}

@override
|void dispose() {
  controller.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(strokeWidth: 2),   
          )
      },

      retun GestureDetector(
        onTap: () => controller.value.isPlaying
          if(controller.value.isPlaying) {
            controller.pause();
  }
}