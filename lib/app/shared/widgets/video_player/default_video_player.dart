import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DefaultVideoPlayer extends StatefulWidget {
  final String video;

  DefaultVideoPlayer({@required this.video});

  @override
  _DefaultVideoPlayerState createState() => _DefaultVideoPlayerState();
}

class _DefaultVideoPlayerState extends State<DefaultVideoPlayer> {
  VideoPlayerController _videoPlayerController;
  bool _errorLoadingVideo = false;
  TextStyle _textStyle = const TextStyle(color: Colors.white, fontSize: 12.0);
  bool _videoFinished = false;
  Color _containerColor = Colors.grey[200];

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.video)
      ..initialize().then((_) {
        setState(() {});
      }).catchError((onError) {
        setState(() {
          _errorLoadingVideo = true;
        });
      });
    _videoPlayerController.addListener(_checkVideo);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _playAndPause() {
    setState(() {
      if (_videoFinished && !_videoPlayerController.value.isPlaying) {
        _videoFinished = false;
        _videoPlayerController.seekTo(Duration(
            seconds: 0,
            minutes: 0,
            milliseconds: 0,
            microseconds: 0,
            hours: 0));
      }

      _videoPlayerController.value.isPlaying
          ? _videoPlayerController.pause()
          : _videoPlayerController.play();
    });
  }

  void _checkVideo() {
    if (_videoPlayerController.value.position ==
            _videoPlayerController.value.duration &&
        !_videoPlayerController.value.isPlaying) {
      setState(() {
        _videoFinished = true;
        _containerColor = Colors.blueAccent;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      padding: EdgeInsets.only(bottom: 2.0),
      color: _containerColor,
      child: _videoPlayerController.value.initialized
          ? Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: _playAndPause,
                  child: Stack(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: _videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(_videoPlayerController),
                      ),
                      _videoPlayerController.value.isPlaying
                          ? Container()
                          : Positioned(
                              top: 0.0,
                              bottom: 0.0,
                              right: 0.0,
                              left: 0.0,
                              child: Icon(
                                Icons.play_circle_outline,
                                size: 80.0,
                                color: Colors.white,
                              ),
                            ),
                    ],
                  ),
                ),
                _videoPlayerController.value.isPlaying
                    ? Container()
                    : Positioned(
                        bottom: 0.0,
                        right: 20.0,
                        left: 0.0,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Slider(
                                  max: _videoPlayerController
                                      .value.duration.inSeconds
                                      .toDouble(),
                                  min: 0.0,
                                  value: _videoPlayerController
                                      .value.position.inSeconds
                                      .toDouble(),
                                  onChanged: (value) {
                                    setState(() {
                                      _videoPlayerController.seekTo(
                                          Duration(seconds: value.toInt()));
                                    });
                                  },
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    _videoPlayerController.value.position
                                        .toString()
                                        .substring(2, 7),
                                    style: _textStyle,
                                  ),
                                  Text(
                                    '/',
                                    style: _textStyle,
                                  ),
                                  Text(
                                    _videoPlayerController.value.duration
                                        .toString()
                                        .substring(2, 7),
                                    style: _textStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
              ],
            )
          : Container(
              height: 200.0,
              alignment: Alignment.center,
              child: _errorLoadingVideo
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.error_outline,
                          size: 80.0,
                          color: Colors.red[200],
                        ),
                        Text(
                          'Erro ao carregar o vídeo',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  : CircularProgressIndicator(),
            ),
    );
  }
}
