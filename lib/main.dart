import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  VideoPlayerController controller;

  VideoPlayerController controller1;
  VideoPlayerController controller2;
  VideoPlayerController controller3;

  @override
  void initState() {
    super.initState();

    /*
    controller = VideoPlayerController.asset('assets/videos/1.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  */

    controller1 = VideoPlayerController.asset('assets/videos/1.mp4');
    controller2 = VideoPlayerController.asset('assets/videos/2.mp4')
      ..initialize();
    controller3 = VideoPlayerController.asset('assets/videos/3.mp4')
      ..initialize();

    controller = controller1
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Builder(
              builder: (context) {
                if (controller.value.initialized) {
                  return AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller),
                  );
                }

                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                onPressed: clip1,
                child: Text('1.mp4'),
              ),
              RaisedButton(
                onPressed: clip2,
                child: Text('2.mp4'),
              ),
              RaisedButton(
                onPressed: clip3,
                child: Text('3.mp4'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton.icon(
                onPressed: play,
                icon: Icon(Icons.play_arrow),
                label: Text('Play'),
              ),
              RaisedButton.icon(
                onPressed: stop,
                icon: Icon(Icons.stop),
                label: Text('Stop'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void play() {
    controller.play();
  }

  void stop() {
    controller.pause();
  }

  void clip1() {
    setState(() {
      final isPlaying = controller.value.isPlaying;

      controller.pause();
      controller = controller1;

      if (isPlaying) {
        controller.play();
      }
    });
  }

  void clip2() {
    setState(() {
      final isPlaying = controller.value.isPlaying;

      controller.pause();
      controller = controller2;

      if (isPlaying) {
        controller.play();
      }
    });
  }

  void clip3() {
    setState(() {
      final isPlaying = controller.value.isPlaying;

      controller.pause();
      controller = controller3;

      if (isPlaying) {
        controller.play();
      }
    });
  }
}
