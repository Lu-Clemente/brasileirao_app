import 'package:brasileirao_app/widgets/Buttons/intro_button.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset("assets/videos/background_video.mp4")
          ..initialize().then((_) {
            setState(() {
              _controller.setVolume(0);
              _controller.play();
              _controller.setLooping(true);
            });
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background video
          _controller.value.isInitialized
              ? SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator()),

          // Overlay content
          const Center(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 90.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'De olho no Brasileirão',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 4.0,
                                color: Colors.black,
                                offset: Offset(1.0, 1.0),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        IntroButton(),
                      ],
                    ),
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
