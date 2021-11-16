
import 'dart:io';

import 'package:flutter/material.dart';
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
      ..setLooping(true)
      ..initialize().then((value) => controller!.pause());
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(controller!);
  }
}