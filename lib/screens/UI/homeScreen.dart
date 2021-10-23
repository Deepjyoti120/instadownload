import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instadownload/screens/UI/photo.dart';
import 'package:instadownload/screens/UI/profile.dart';
import 'package:instadownload/screens/UI/video.dart';

class MainInsta extends StatefulWidget {
  @override
  _MainInstaState createState() => _MainInstaState();
}

class _MainInstaState extends State<MainInsta> {
  int _currentIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        automaticallyImplyLeading: false,
        title: Text(
          "Instaexport",
          style: GoogleFonts.oleoScriptSwashCaps(
              fontSize: 26, color: Colors.black),
        ),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: [
            ProfileSection(),
            PhotoSection(),
            VideoSection(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        // showElevation: false
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController!.jumpToPage(index);
        },
        items: [
          BottomNavyBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Icon(FeatherIcons.userCheck),
            ),
            title: Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Text('Profile'),
            ),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            title: Text('Photo'),
            // activeColor: Colors.pink,
            textAlign: TextAlign.center,
            icon: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Icon(FeatherIcons.camera)),
          ),
          BottomNavyBarItem(
            title: Text('Video'),
            // activeColor: Colors.pink,
            textAlign: TextAlign.center,
            icon: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Icon(FeatherIcons.film)),
          ),
        ],
      ),
    );
  }
}
