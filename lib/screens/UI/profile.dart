import 'package:cached_network_image/cached_network_image.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:instaget/ads/adsHelper.dart';
import 'package:instaget/api/instaGet.dart';
import 'package:instaget/screens/widgets/CenterFBtn.dart';
import 'package:instaget/screens/widgets/progressAwesome.dart';
import 'package:instaget/screens/widgets/searchField.dart';
import 'package:instaget/screens/widgets/tipsWidget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class ProfileSection extends StatefulWidget {
  const ProfileSection({
    Key? key,
  }) : super(key: key);
  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  TextEditingController profileName = TextEditingController();
  final String url = "https://www.instagram.com/";
  final String verifyCode = "/?__a=1";
  InstaGet flutterInsta = InstaGet();
  BannerAd? _ad;
  bool? isLoaded;

  @override
  void initState() {
    super.initState();
    _ad = BannerAd(
      size: AdSize.fullBanner,
      // size: AdSize.mediumRectangle,
      adUnitId: AdsHelper.bannerAdUnitId,
      request: AdRequest(),
      listener: BannerAdListener(onAdLoaded: (_) {
        setState(() {
          isLoaded = true;
        });
      }),
    );
    _ad!.load();
  }

  @override
  void dispose() {
    _ad!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: RadialGradient(
            center: Alignment(-0.61, 1.18),
            radius: 0.953,
            colors: [
              const Color(0xFFFFDD55),
              const Color(0xFFFFE477),
              const Color(0xFFFF3920),
              const Color(0xFFCE48B3)
            ],
            stops: [0.0, 0.127, 0.492, 1.0],
          ),
        ),
        child: FloatingActionButton.extended(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () async {
            await downloadProfile();
          },
          label: FloatingActionBtn(
            icon: Icon(
              FeatherIcons.arrowDownCircle,
              color: Colors.white,
              size: 18,
            ),
            titleText: Text(
              "Get Profile",
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
              SearchField(
                labelText: 'Profile username',
                pasteValue: profileName,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      FlutterClipboard.paste().then((value) {
                        setState(() {
                          profileName.text = value;
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
                      await canLaunch(url + profileName.text + verifyCode)
                          ? launch(url + profileName.text)
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
              newMethod(),
              SizedBox(height: 12),
              ExpansionTile(
                collapsedTextColor: Color(0xff1abc9c),
                iconColor: Colors.blue,
                textColor: Color(0xff16a085),
                title: Row(
                  children: [
                    Icon(
                      FeatherIcons.codesandbox,
                      size: 18,
                      color: Color(0xff1abc9c),
                    ),
                    SizedBox(width: 6),
                    Row(
                      children: [
                        Text("Pro Tips-",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff1abc9c),
                            )),
                        SizedBox(
                          width: 4,
                        ),
                        Text("If Download not start",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff1abc9c),
                            )),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Icon(
                    //       FeatherIcons.codesandbox,
                    //       size: 22,
                    //       color: Color(0xff1abc9c),
                    //     ),
                    //     Text("Pro Tips-",
                    //         style: TextStyle(
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.bold,
                    //           color: Color(0xff1abc9c),
                    //         )),
                    //     SizedBox(
                    //       width: 4,
                    //     ),
                    //     Text("if Download Not Start",
                    //         style: TextStyle(
                    //           fontSize: 12,
                    //           fontWeight: FontWeight.bold,
                    //           color: Color(0xff1abc9c),
                    //         )),
                    //   ],
                    // ),
                  ],
                ),
                children: [
                  TipsWidget(),
                ],
              ),
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
                      'How to get profile',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                children: [
                  Text(
                    'Please Search Profile username Only',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff34495e),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'eg. appdesignx',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffff4d4d)),
                  ),
                  Text(
                    'Then type profile username and get your Profile',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://raw.githubusercontent.com/Deepjyoti120/InstaDownloadAssets/master/Assets/Images/profile.jpg',
                      placeholder: (context, url) => progressAwesome(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 5),
              // Text(
              //   'Now click on Get Profile Button',
              //   style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget newMethod() {
    if (isLoaded == true) {
      return Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16))),
        width: _ad?.size.width.toDouble(),
        height: _ad?.size.height.toDouble(),
        child: AdWidget(
          ad: _ad!,
        ),
      );
    }
    return progressAwesome();
  }

  Future downloadProfile() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      try {
        var getvideourl =
            await flutterInsta.getProfileDetails(profileName.text);
        String s = getvideourl;
        var uri = Uri.parse(s);
        String ws = uri.pathSegments.last;
        await FlutterDownloader.enqueue(
          url: '$getvideourl',
          fileName: ws,
          savedDir: '/sdcard/Download/',
          showNotification: true,
          openFileFromNotification: true,
        ).whenComplete(() => showSnackbar());
      } catch (e) {
        // return downloadProfile();
        return showSnackbarErrorProfile();
      }
    } else {
      print("Permission deined");
    }
  }

  Future reStartGetProfile() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      try {
        var getvideourl =
            await flutterInsta.getProfileDetails(profileName.text);
        String s = getvideourl;
        var uri = Uri.parse(s);
        String ws = uri.pathSegments.last;
        await FlutterDownloader.enqueue(
          url: '$getvideourl',
          fileName: ws,
          savedDir: '/sdcard/Download/',
          showNotification: true,
          openFileFromNotification: true,
        ).whenComplete(() => showSnackbar());
      } catch (e) {
        return reStartGetProfile();
      }
    } else {
      print("Permission deined");
    }
  }

  // show Snackbar
  void showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 5),
        content: Text(
          "Success",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[700],
        // action: SnackBarAction(
        //   onPressed: () {},
        //   label: "Undo",
        //   textColor: Colors.white,
        // ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // Error notification
  showSnackbarErrorProfile() {
    // showSnackbarError(String s) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: Text(
          // "Instagram Profile API is show! Please try again or wait... it will automaticall saved to your Galley once API is Active. While your profile Downloading Please try Photo and Videos .. Thank you .",
          "Instagram Profile API is slow! Please try again later",
          // s,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red[700],
        // action: SnackBarAction(
        //   onPressed: () {},
        //   label: "Undo",
        //   textColor: Colors.white,
        // ),
        behavior: SnackBarBehavior.floating,
      ),
    );
    return reStartGetProfile();
  }
}
