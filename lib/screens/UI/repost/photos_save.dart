import 'package:flutter/material.dart';
import 'package:getprofile/screens/widgets/gradient/text_gradient.dart';
import 'dart:io';

import 'package:share/share.dart';

class PhotosDownloaded extends StatefulWidget {
  const PhotosDownloaded({Key? key}) : super(key: key);

  @override
  _PhotosDownloadedState createState() => _PhotosDownloadedState();
}

final Directory _photoDir =
    Directory('/storage/emulated/0/Download/GetProfile');

class _PhotosDownloadedState extends State<PhotosDownloaded> {
  @override
  Widget build(BuildContext context) {
    final imageList = _photoDir
        .listSync()
        .map((item) => item.path)
        .where((item) => item.endsWith('.jpg'))
        .toList(growable: false);
    if (imageList.isNotEmpty) {
      return GridView.builder(
        itemCount: imageList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.75,
          mainAxisExtent: 270,
        ),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final imgPath = imageList[index];
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
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: Hero(
                        tag: imgPath,
                        child: Image.file(
                          File(imgPath),
                          width: MediaQuery.of(context).size.width,
                          height: 270,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 4,
                      right: 4,
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
                            await Share.shareFiles([imgPath]);
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
                    )
                  ],
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
                'Sorry, No Image Found!',
                style: TextStyle(fontSize: 18.0),
              )),
        ),
      );
    }
  }
}
