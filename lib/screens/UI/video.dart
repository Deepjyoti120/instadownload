import 'package:cached_network_image/cached_network_image.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:instaget/api/instaGet.dart';
import 'package:instaget/screens/widgets/CenterFBtn.dart';
import 'package:instaget/screens/widgets/progressAwesome.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoSection extends StatefulWidget {
  const VideoSection({
    Key? key,
  }) : super(key: key);

  @override
  State<VideoSection> createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {
  final TextEditingController videoPhotoLink = TextEditingController();
  InstaGet flutterInsta = InstaGet();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 2,
        onPressed: () {
          downloadVideo();
        },
        label: FloatingActionBtn(
          icon: Icon(
            FeatherIcons.arrowDownCircle,
            // FeatherIcons.download,
            color: Colors.white,
            size: 18,
          ),
          titleText: Text(
            "Get Video",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 26.0,
          ),
          child: Column(
            children: [
              TextField(
                controller: videoPhotoLink,
                // cursorColor: Colors.yellow,
                // style: TextStyle(
                //   color: Colors.blue,
                // ),
                decoration: InputDecoration(
                  labelText: 'Paste Video link',
                  filled: true,
                  fillColor: Colors.white,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  contentPadding: EdgeInsets.all(16),
                  prefixIcon: Icon(
                    FeatherIcons.search,
                    color: Colors.black,
                    size: 18,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    // 0xFF
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 1.0),
                    // borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  // border: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.blue, width: 0.0),
                  //   borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  // ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      FlutterClipboard.paste().then((value) {
                        setState(() {
                          videoPhotoLink.text = value;
                          // pasteValue = value;
                        });
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                      child: Text('Paste'),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await canLaunch(videoPhotoLink.text)
                          ? launch(videoPhotoLink.text)
                          : print("Can not launch");
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                      child: Text('Verify'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              ExpansionTile(
                collapsedTextColor: Color(0xff1abc9c),
                iconColor: Colors.blue,
                textColor: Color(0xff16a085),
                title: Row(
                  children: [
                    Icon(
                      FeatherIcons.checkCircle,
                      size: 18,
                      color: Color(0xff1abc9c),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'How to get Reels/Videos',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                children: [
                  SizedBox(
                    height: 300,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            'Copy post link and paste then ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff34495e),
                            ),
                          ),
                          SizedBox(height: 2),
                          // Text(
                          //   'eg. deepjyoti_sam',
                          //   style: TextStyle(
                          //       fontSize: 13,
                          //       fontWeight: FontWeight.bold,
                          //       color: Color(0xffff4d4d)),
                          // ),
                          // Text(
                          //   'Then paste link by clicking paste button',
                          //   style: TextStyle(
                          //       fontSize: 12, fontWeight: FontWeight.bold),
                          // ),
                          SizedBox(
                            height: 4,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://raw.githubusercontent.com/Deepjyoti120/InstaDownloadAssets/master/Assets/Images/copylinkReels01.jpg',
                              placeholder: (context, url) =>
                                  progressAwesome(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ExpansionTile(
                collapsedTextColor: Color(0xff1abc9c),
                iconColor: Colors.blue,
                textColor: Color(0xff16a085),
                title: Row(
                  children: [
                    Icon(
                      FeatherIcons.checkCircle,
                      size: 18,
                      color: Color(0xff1abc9c),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'How to get Reels/Videos link',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                children: [
                  SizedBox(
                    height: 300,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            'Copy post link and paste then ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff34495e),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'eg. see on Example photo and click copy link tab',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffff4d4d)),
                          ),
                          Text(
                            'Then paste link by clicking paste button',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://raw.githubusercontent.com/Deepjyoti120/InstaDownloadAssets/master/Assets/Images/copylinkReels02.jpg',
                              placeholder: (context, url) =>
                                  progressAwesome(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void downloadVideo() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      try {
        var myvideourl = await flutterInsta.getInstaVideo(videoPhotoLink.text);
        String s = myvideourl;
        var uri = Uri.parse(s);
        String ws = uri.pathSegments.last;
        await FlutterDownloader.enqueue(
          url: '$myvideourl',
          fileName: ws,
          savedDir: '/sdcard/Download/',
          showNotification: true,
          openFileFromNotification: true,
        ).whenComplete(() => showSnackbar());
      } catch (e) {
        return showSnackbarErrorVideo();
      }
    } else {
      print("Permission deined");
    }
  }

  void showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 5),
        content: Text(
          "Success",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[700],
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void showSnackbarErrorVideo() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: Text(
          "Please verify link and try again",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red[700],
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
