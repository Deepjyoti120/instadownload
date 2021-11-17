import 'dart:io';
import 'package:flutter/material.dart';
import 'package:getprofile/screens/whatsapp/widgets/video_state.dart'; 
import 'package:share/share.dart';

class VideoDownload extends StatefulWidget {
  const VideoDownload({
    Key? key,
  }) : super(key: key);

  @override
  _VideoDownloadState createState() => _VideoDownloadState();
}

final Directory directory =
    Directory('/storage/emulated/0/WhatsApp/Media/.Statuses');

class _VideoDownloadState extends State<VideoDownload> {
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
          mainAxisExtent: 362,
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
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () async {
                        try {
                          final originalVideoFile = File(videoPath);
                          if (!Directory(
                                  '/storage/emulated/0/Download/GetProfile/StatusSave')
                              .existsSync()) {
                            Directory(
                                    '/storage/emulated/0/Download/GetProfile/StatusSave')
                                .createSync(recursive: true);
                          }
                          final curDate = DateTime.now().toString();
                          final newFileName =
                              '/storage/emulated/0/Download/GetProfile/StatusSave/GetProfile-$curDate.jpg';
                          await originalVideoFile.copy(newFileName);
                          showSnackbar();
                        } catch (e) {
                          showSnackbarError();
                        }
                      },
                      icon: const Icon(
                        Icons.download,
                        color: Colors.purpleAccent,
                      ),
                    ),
                    const SizedBox(width: 6),
                    IconButton(
                      onPressed: () async {
                        await Share.shareFiles([videoPath]);
                      },
                      icon: const Icon(
                        Icons.share_outlined,
                        color: Colors.purpleAccent,
                      ),
                    )
                  ],
                )
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

  void showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: const Text(
          "Saved on your gallery",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[700],
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void showSnackbarError() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: const Text(
          "Error Please try again",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red[700],
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
