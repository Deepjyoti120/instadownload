import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:share/share.dart';
import 'package:video_player/video_player.dart';

import 'package:getprofile/screens/widgets/gradient/text_gradient.dart';

class VideoState extends StatefulWidget {
  const VideoState({
    Key? key,
    required this.filePath,
    required this.videoPath,
  }) : super(key: key);
  final File filePath;
  final String videoPath;
  @override
  _VideoStateState createState() => _VideoStateState();
}

class _VideoStateState extends State<VideoState> {
  VideoPlayerController? controller;
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.file(widget.filePath)
      ..addListener(() => setState(() {}))
      ..setLooping(false)
      ..initialize().then((value) => controller!.pause());
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
              height: 302,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: GestureDetector(
                  onTap: () => controller!.value.isPlaying
                      ? controller!.pause()
                      : controller!.play(),
                  child: VideoPlayer(controller!)),
            ),
          ),
        ),
        controller!.value.isPlaying
            ? Container()
            : Positioned(
                bottom: 7,
                right: 34,
                child: Container(
                  height: 26,
                  width: 64,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFdff9fb),
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    iconSize: 16,
                    hoverColor: Colors.amberAccent,
                    onPressed: () async {
                      await Share.shareFiles([widget.videoPath]);
                    },
                    icon: Row(
                      children: const [
                        Icon(
                          Icons.share_outlined,
                          color: Colors.purpleAccent,
                        ),
                        TextGradient(text: 'Repost', appbarfontsize: 14)
                      ],
                    ),
                  ),
                ),
              ),
        Positioned(
          bottom: 12,
          right: 12,
          child: Icon(
            controller!.value.isPlaying
                ? FeatherIcons.pauseCircle
                : FeatherIcons.playCircle,
            size: 18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
