import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:getprofile/api/api.dart';
import 'package:getprofile/screens/widgets/ads/rectangle_banner.dart';
import 'package:getprofile/screens/widgets/center_floatbtn.dart'; 
import 'package:getprofile/screens/widgets/gradient/getprofile_bg_color.dart';
import 'package:getprofile/screens/widgets/progress_awesome.dart';
import 'package:getprofile/screens/widgets/search_field.dart';
import 'package:getprofile/screens/widgets/tips_widget.dart';
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
  final Getprofile flutterInsta = Getprofile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        decoration: getProfileBGColor(),
        child: FloatingActionButton.extended(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () async {
            await downloadProfile();
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
              SearchField(
                labelText: 'Profile username',
                pasteValue: profileName,
              ),
              const SizedBox(height: 10),
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
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(14, 8, 14, 8),
                      child: Text('Paste'),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await canLaunch(url + profileName.text + verifyCode)
                          ? launch(url + profileName.text)
                          : debugPrint("Can not launch");
                    },
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(14, 8, 14, 8),
                      child: Text('Verify'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10), 
              ExpansionTile(
                collapsedTextColor:const Color(0xff1abc9c),
                iconColor: Colors.blue,
                textColor:const Color(0xff16a085),
                title: Row(
                  children: [
                   const Icon(
                      FeatherIcons.codesandbox,
                      size: 18,
                      color: Color(0xff1abc9c),
                    ),
                 const   SizedBox(width: 6),
                    Row(
                      children:const [
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
                children:const [
                  TipsWidget(),
                ],
              ),
              ExpansionTile(
                collapsedTextColor:const Color(0xff1abc9c),
                iconColor: Colors.blue,
                textColor:const Color(0xff16a085),
                title: Row(
                  children:const [
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
                 const Text(
                    'Please Search Profile username Only',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff34495e),
                    ),
                  ),
                const  SizedBox(height: 2),
                 const Text(
                    'eg. appdesignx',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffff4d4d)),
                  ),
                const  Text(
                    'Then type profile username and get your Profile',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                const  SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://raw.githubusercontent.com/Deepjyoti120/InstaDownloadAssets/master/Assets/Images/profile.jpg',
                      placeholder: (context, url) => progressAwesome(),
                      errorWidget: (context, url, error) =>const Icon(Icons.error),
                    ),
                  ),
                ],
              ),
           const   BannerRectangle(),
            ],
          ),
        ),
      ),
    );
  }

  Future downloadProfile() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      try {
        if (!Directory('/storage/emulated/0/Download/GetProfile/')
            .existsSync()) {
          Directory('/storage/emulated/0/Download/GetProfile/')
              .createSync(recursive: true);
        }
        var getvideourl =
            await flutterInsta.getprofileDetails(profileName.text);
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
        // return downloadProfile();
        return showSnackbarErrorProfile();
      }
    } else {
      debugPrint("Permission deined");
    }
  }

  Future reStartgetprofile() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      try { 
        var getvideourl =
            await flutterInsta.getprofileDetails(profileName.text);
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

  // show Snackbar
  void showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content:const Text(
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
        duration:const Duration(seconds: 2),
        content:const Text(
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
    return reStartgetprofile();
  }
}
