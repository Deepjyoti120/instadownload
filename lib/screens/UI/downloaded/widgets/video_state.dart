import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:video_player/video_player.dart';

class ConsFile extends StatefulWidget {
  const ConsFile({
    Key? key,
    required this.file,
  }) : super(key: key);
  final File file;
  @override
  _ConsFileState createState() => _ConsFileState();
}

class _ConsFileState extends State<ConsFile> {
  VideoPlayerController? controller;
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.file(widget.file)
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
    // return GestureDetector(
    // onTap: () => controller!.value.isPlaying
    //     ? controller!.pause()
    //     : controller!.play(),
    // child: VideoPlayer(controller!));
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
        Positioned(
          bottom: 12,
          right: 12,
          child: SafeArea(
            child: Icon(
              controller!.value.isPlaying
                  ? FeatherIcons.pauseCircle
                  : FeatherIcons.playCircle,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
