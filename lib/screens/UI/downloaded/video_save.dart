import 'dart:io';
import 'package:flutter/material.dart';
import 'package:getprofile/screens/whatsapp/widgets/video_state.dart';
import 'package:getprofile/screens/widgets/gradient/getprofile_bg_color.dart';

class VideoDownloaded extends StatefulWidget {
  const VideoDownloaded({
    Key? key,
  }) : super(key: key);

  @override
  _VideoDownloadedState createState() => _VideoDownloadedState();
}

final Directory directory =
    Directory('/storage/emulated/0/Download/GetProfile');

class _VideoDownloadedState extends State<VideoDownloaded> {
  @override
  Widget build(BuildContext context) {
    final videoList = directory
        .listSync()
        .map((item) => item.path)
        .where((item) => item.endsWith('.mp4'))
        .toList(growable: false);
    if (videoList.isNotEmpty) {
      return GridView.builder(
        itemCount: videoList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.75,
          mainAxisExtent: 302,
        ),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final videoPath = videoList[index];
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(6)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFdff9fb),
                  blurRadius: 6,
                  spreadRadius: 2,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConsFile(
                  file: File(videoPath),
                ),
              ],
            ),
          );
        },
      );
    } else {
      return Scaffold(
        body: Center(
          child: Container(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: const Text(
              'Sorry, No Videos Found!',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ),
      );
    }
  }
}
