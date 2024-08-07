import 'dart:async';
import 'package:better_player/better_player.dart';
import 'package:blingpay_assesment/features/post/data/models/video_list_data.dart';
import 'package:blingpay_assesment/features/post/presentation/widgets/reuseable_video_controller.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PostVideo extends StatefulWidget {
  final VideoListData? videoListData;
  final ReusableVideoListController? videoListController;
  final Function? canBuildVideo;

  const PostVideo({
    super.key,
    this.videoListData,
    this.videoListController,
    this.canBuildVideo,
  });

  @override
  PostVideoState createState() =>
      PostVideoState();
}

class PostVideoState extends State<PostVideo> {
  VideoListData? get videoListData => widget.videoListData;
  BetterPlayerController? controller;
  StreamController<BetterPlayerController?>
  betterPlayerControllerStreamController = StreamController.broadcast();
  bool _initialized = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    betterPlayerControllerStreamController.close();
    super.dispose();
  }

  void _setupController() {
    if (controller == null) {
      controller = widget.videoListController!.getBetterPlayerController();
      if (controller != null) {
        controller!.setupDataSource(BetterPlayerDataSource.network(
            videoListData!.post.link ?? '',
            cacheConfiguration:
            const BetterPlayerCacheConfiguration(useCache: true)));
        if (!betterPlayerControllerStreamController.isClosed) {
          betterPlayerControllerStreamController.add(controller);
        }
        controller!.addEventsListener(onPlayerEvent);
        controller?.play();
      }
    }
  }

  void _freeController() {
    if (!_initialized) {
      _initialized = true;
      return;
    }
    if (controller != null && _initialized) {
      controller!.removeEventsListener(onPlayerEvent);
      widget.videoListController!.freeBetterPlayerController(controller);
      controller!.pause();
      controller = null;
      if (!betterPlayerControllerStreamController.isClosed) {
        betterPlayerControllerStreamController.add(null);
      }
      _initialized = false;
    }
  }

  void onPlayerEvent(BetterPlayerEvent event) {
    if (event.betterPlayerEventType == BetterPlayerEventType.progress) {
      videoListData!.lastPosition = event.parameters!["progress"] as Duration?;
    }
    if (event.betterPlayerEventType == BetterPlayerEventType.initialized) {
      if (videoListData!.lastPosition != null) {
        controller!.seekTo(videoListData!.lastPosition!);
      }
      if (videoListData!.wasPlaying!) {
        controller!.play();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(hashCode.toString() + DateTime.now().toString()),
      onVisibilityChanged: (info) {
        if (!widget.canBuildVideo!()) {
          _timer?.cancel();
          _timer = null;
          _timer = Timer(const Duration(milliseconds: 500), () {
            if (info.visibleFraction >= 0.6) {
              _setupController();
            } else {
              _freeController();
            }
          });
          return;
        }
        if (info.visibleFraction >= 0.6) {
          _setupController();
        } else {
          _freeController();
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: StreamBuilder<BetterPlayerController?>(
          stream: betterPlayerControllerStreamController.stream,
          builder: (context, snapshot) {
            return AspectRatio(
              aspectRatio: 16 / 9,
              child: controller != null
                  ? BetterPlayer(
                controller: controller!,
              )
                  : Container(
                color: Colors.black,
                child: const Center(
                  child: CircularProgressIndicator(
                    valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void deactivate() {
    if (controller != null) {
      videoListData!.wasPlaying = controller!.isPlaying();
    }
    _initialized = true;
    super.deactivate();
  }
}