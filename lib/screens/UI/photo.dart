import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:getprofile/api/api.dart';
import 'package:getprofile/screens/widgets/ads/rectangle_banner.dart';
import 'package:getprofile/screens/widgets/center_floatbtn.dart';
import 'package:getprofile/screens/widgets/gradient/getprofile_bg_color.dart';
import 'package:getprofile/screens/widgets/progress_awesome.dart';
import 'package:getprofile/screens/widgets/shimmer.dart';
import 'package:getprofile/services/intent.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class PhotoSection extends StatefulWidget {
  const PhotoSection({
    Key? key,
  }) : super(key: key);

  @override
  State<PhotoSection> createState() => _PhotoSectionState();
}

class _PhotoSectionState extends State<PhotoSection> {
  late TextEditingController pastePhotoLink = TextEditingController();
  Getprofile flutterInsta = Getprofile();
  String _shareTextController = "";
  @override
  void initState() {
    super.initState();
    // ::::
    // Create the share service
    ShareService()
      // Register a callback so that we handle shared data if it arrives while the
      // app is running
      ..onDataReceived = _handleSharedData
      // Check to see if there is any shared data already, meaning that the app
      // was launched via sharing.
      ..getSharedData().then(_handleSharedData);
    // ::::
  }

  /// Handles any shared data we may receive.
  void _handleSharedData(String sharedData) {
    setState(() {
      String s = sharedData;
      var uri = Uri.parse(s);
      String ws = uri.pathSegments.first;
      _shareTextController = ws;
      if (_shareTextController == 'p') {
        pastePhotoLink.text = sharedData;
      } else {
        pastePhotoLink.text = '';
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        decoration: getProfileBGColor(),
        child: FloatingActionButton.extended(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {
            downloadPhoto();
          },
          label: const FloatingActionBtn(
            icon: Icon(
              FeatherIcons.arrowDownCircle,
              color: Colors.white,
              size: 18,
            ),
            titleText: Text(
              "Download",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
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
                controller: pastePhotoLink,
                decoration: const InputDecoration(
                  labelText: 'Paste Post copied link',
                  filled: true,
                  fillColor: Colors.white,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  contentPadding: EdgeInsets.all(16),
                  prefixIcon: Icon(
                    FeatherIcons.instagram,
                    color: Colors.black,
                    size: 18,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.0),
                  ),
                ),
              ),
              const ShimmerText(text: 'Download Instagram Photos in HD'),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      FlutterClipboard.paste().then((value) {
                        setState(() {
                          pastePhotoLink.text = value;
                        });
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                      child: Row(
                        children: const [
                          Icon(
                            FeatherIcons.copy,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text('Paste'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await canLaunch(pastePhotoLink.text)
                          ? launch(pastePhotoLink.text)
                          : debugPrint("Can not launch");
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                      child: Row(
                        children: const [
                          Icon(
                            FeatherIcons.instagram,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text('View'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ExpansionTile(
                collapsedTextColor: const Color(0xff1abc9c),
                iconColor: Colors.blue,
                textColor: const Color(0xff16a085),
                title: Row(
                  children: const [
                    Icon(
                      FeatherIcons.checkCircle,
                      size: 18,
                      color: Color(0xff1abc9c),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'How to get posts',
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
                          const Text(
                            'Copy post link and paste then ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff34495e),
                            ),
                          ),
                          const SizedBox(height: 2),
                          const SizedBox(
                            height: 4,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://raw.githubusercontent.com/Deepjyoti120/InstaDownloadAssets/master/Assets/Images/Photo01.jpg',
                              placeholder: (context, url) => progressAwesome(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ExpansionTile(
                collapsedTextColor: const Color(0xff1abc9c),
                iconColor: Colors.blue,
                textColor: const Color(0xff16a085),
                title: Row(
                  children: const [
                    Icon(
                      FeatherIcons.checkCircle,
                      size: 18,
                      color: Color(0xff1abc9c),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'How to get posts link',
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
                          const Text(
                            'Copy post link and paste then ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff34495e),
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'eg. see on Example photo and click copy link tab',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffff4d4d)),
                          ),
                          const Text(
                            'Then paste link by clicking paste button',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://raw.githubusercontent.com/Deepjyoti120/InstaDownloadAssets/master/Assets/Images/Photo02.jpg',
                              placeholder: (context, url) => progressAwesome(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const BannerRectangle(),
            ],
          ),
        ),
      ),
    );
  }

  downloadPhoto() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      try {
        if (!Directory('/storage/emulated/0/Download/GetProfile/')
            .existsSync()) {
          Directory('/storage/emulated/0/Download/GetProfile/')
              .createSync(recursive: true);
        }
        var getvideourl = await flutterInsta.getPostPhoto(pastePhotoLink.text);
        String s = getvideourl;
        var uri = Uri.parse(s);
        String ws = uri.pathSegments.last;
        await FlutterDownloader.enqueue(
          url: getvideourl,
          fileName: ws,
          savedDir: '/storage/emulated/0/Download/GetProfile/',
          showNotification: true,
          openFileFromNotification: true,
        ).whenComplete(() => showSnackbar());
      } catch (e) {
        return showSnackbarErrorPhoto();
      }
    } else {
      debugPrint("Permission deined");
    }
  }

  void showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: const Text(
          "Success",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[700],
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future reStartgetprofile() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      try {
        var getvideourl = await flutterInsta.getPostPhoto(pastePhotoLink.text);
        String s = getvideourl;
        var uri = Uri.parse(s);
        String ws = uri.pathSegments.last;
        await FlutterDownloader.enqueue(
          url: getvideourl,
          fileName: ws,
          savedDir: '/storage/emulated/0/Download/GetProfile/',
          showNotification: true,
          openFileFromNotification: true,
        ).whenComplete(() => showSnackbar());
      } catch (e) {
        return reStartgetprofile();
      }
    } else {
      debugPrint("Permission deined");
    }
  }

  showSnackbarErrorPhoto() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: const Text(
          "Please try again",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red[700],
        behavior: SnackBarBehavior.floating,
      ),
    );
    return reStartgetprofile();
  }
}
