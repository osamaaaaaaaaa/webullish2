import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  late String link;
  VideoApp({required this.link});
  @override
  _VideoAppState createState() => _VideoAppState(link: link);
}

class _VideoAppState extends State<VideoApp> {
  late String link;
  _VideoAppState({required this.link});
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(link)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? Stack(
              children: [
                Container(
                  height: 250,
                  child: VideoPlayer(_controller),
                ),
                Center(
                  child: FloatingActionButton(
                    backgroundColor: Color.fromARGB(0, 255, 255, 255),
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),
                ),
              ],
            )
          : Container(),
    );
    // floatingActionButton:
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
