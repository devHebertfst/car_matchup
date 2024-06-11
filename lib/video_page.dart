import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';



class VideoPage extends StatelessWidget {
  final String videoUrl;

  const VideoPage({required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrl) ?? '',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: YoutubePlayerBuilder(
                player: YoutubePlayer(controller: _controller),
                builder: (context, player) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      player,
                      CircularProgressIndicator(),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

