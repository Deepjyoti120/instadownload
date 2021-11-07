import 'package:cached_network_image/cached_network_image.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:getprofile/ads/adsHelper.dart';
import 'package:getprofile/api/api.dart';
import 'package:getprofile/screens/widgets/CenterFBtn.dart';
import 'package:getprofile/screens/widgets/progressAwesome.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';
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
  final TextEditingController pastePhotoLink = TextEditingController();
  getprofile flutterInsta = getprofile();
  final _controller = NativeAdController();
  Widget? child;
  @override
  void initState() {
    super.initState();
    _controller.onEvent.listen((e) {
      final event = e.keys.first;
      // final info = e.values.first;
      switch (event) {
        case NativeAdEvent.loaded:
          // setState(() => _bannerAdHeight = (info as int)?.toDouble());
          break;
        default:
          break;
      }
    });
    _controller.load();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(146.0),
          gradient: RadialGradient(
            center: Alignment(0.54, 1.19),
            radius: 0.953,
            colors: [
              const Color(0xFFFFDD55),
              const Color(0xFFFFE477),
              const Color(0xFFFF8D7E),
              const Color(0xFFE825C1)
            ],
            stops: [0.0, 0.127, 0.492, 1.0],
          ),
        ),
        child: FloatingActionButton.extended(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {
            downloadPhoto();
          },
          label: FloatingActionBtn(
            icon: Icon(
              FeatherIcons.arrowDownCircle,
              // FeatherIcons.download,
              color: Colors.white,
              size: 18,
            ),
            titleText: Text(
              "Get Photo",
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
                // cursorColor: Colors.yellow,
                // style: TextStyle(
                //   color: Colors.blue,
                // ),
                decoration: InputDecoration(
                  labelText: 'Paste Post copied link',
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
                          pastePhotoLink.text = value;
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
                      await canLaunch(pastePhotoLink.text)
                          ? launch(pastePhotoLink.text)
                          : print("Can not launch");
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                      child: Text('Verify'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              BannerAd(
                unitId: 'ca-app-pub-7265627105635702/5035760798',
                builder: (context, child) {
                  return Container(
                    child: child,
                  );
                },
                loading: Center(child: progressAwesome()),
                error: Text('error'),
                size: BannerSize.ADAPTIVE,
              ),
              SizedBox(height: 4),
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
                                  'https://raw.githubusercontent.com/Deepjyoti120/InstaDownloadAssets/master/Assets/Images/Photo01.jpg',
                              placeholder: (context, url) => progressAwesome(),
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
                                  'https://raw.githubusercontent.com/Deepjyoti120/InstaDownloadAssets/master/Assets/Images/Photo02.jpg',
                              placeholder: (context, url) => progressAwesome(),
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
              BannerAd(
                unitId: AdsHelper.mediumRectangleAdUnitId,
                builder: (context, child) {
                  return Container(
                    child: child,
                  );
                },
                loading: Center(child: progressAwesome()),
                error: Text('error'),
                size: BannerSize.MEDIUM_RECTANGLE,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void downloadPhoto() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      try {
        var getvideourl = await flutterInsta.getPostPhoto(pastePhotoLink.text);
        String s = getvideourl;
        var uri = Uri.parse(s);
        String ws = uri.pathSegments.last;
        // FileName: edit end
        await FlutterDownloader.enqueue(
          url: '$getvideourl',
          fileName: ws,
          savedDir: '/sdcard/Download/',
          showNotification: true,
          openFileFromNotification: true,
        ).whenComplete(() => showSnackbar());
      } catch (e) {
        return showSnackbarErrorPhoto();
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

  void showSnackbarErrorPhoto() {
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
