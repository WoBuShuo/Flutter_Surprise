import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bean/PlayUrlBean.dart';
import 'package:flutter_app/net/SecondHttpManager.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  String _videoUrl;

  VideoPage(this._videoUrl);

  @override
  State<StatefulWidget> createState() {
    return VideoState(_videoUrl);
  }
}

class VideoState extends State<VideoPage> {
  VideoPlayerController _controller;
  String _videoUrl;

  VideoState(this._videoUrl);
  @override
  void initState() {
    super.initState();
      _controller = VideoPlayerController.network("")
        ..initialize().then((_) {
        });
    SecondHttpManager.getInstance().getMovieUrl(_videoUrl, onSuccess: (data) {
      PlayUrlBean bean=data as PlayUrlBean;
      _controller = VideoPlayerController.network(bean.playUrlAndSizeList[0].url)
        ..initialize().then((_) {
          setState(() {});
        });

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("视频"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 250,
            child: _controller.value.initialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
