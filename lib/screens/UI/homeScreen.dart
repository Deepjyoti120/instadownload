import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:getprofile/screens/widgets/gradient/textGradient.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:getprofile/screens/UI/photo.dart';
import 'package:getprofile/screens/UI/profile.dart';
import 'package:getprofile/screens/UI/video.dart';
import 'package:getprofile/screens/widgets/gradient/gradientStyle.dart';

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
        title: TextGradient(
          text: "Getprofile",
        ),
        // title: Text(
        //
        //   style: GoogleFonts.oleoScriptSwashCaps(
        //       fontSize: 26, color: Colors.black),
        // ),
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
            activeColor: _currentIndex == 0 ? Colors.red : Colors.blue,
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
            activeColor: _currentIndex == 1 ? Colors.red : Colors.blue,
            title: Text('Photo'),
            // activeColor: Colors.pink,
            textAlign: TextAlign.center,
            icon: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Icon(FeatherIcons.camera)),
          ),
          BottomNavyBarItem(
            activeColor: _currentIndex == 2 ? Colors.red : Colors.blue,
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
