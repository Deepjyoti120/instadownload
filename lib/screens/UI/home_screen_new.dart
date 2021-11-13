import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:getprofile/screens/UI/bottomBar/custom_bar.dart';
import 'package:getprofile/screens/UI/photo.dart';
import 'package:getprofile/screens/UI/profile.dart';
import 'package:getprofile/screens/UI/video.dart';
import 'package:getprofile/screens/widgets/gradient/text_gradient.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NewHomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        automaticallyImplyLeading: false,
        title: const TextGradient(text: "Getprofile"),
      ),
      body: getBody(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {
    return CustomBottomBar(
      containerHeight: 60,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.bounceOut,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomBarItem>[
        BottomBarItem(
            icon: const Icon(FeatherIcons.userCheck),
            title: const Text('Profile')),
        BottomBarItem(
          icon: const Icon(FeatherIcons.camera),
          title: const Text('Photo'),
          activeColor: Colors.purpleAccent,
        ),
        BottomBarItem(
          icon: const Icon(FeatherIcons.film),
          title: const Text('Reels '),
        ),
      ],
    );
  }

  Widget getBody() {
    List<Widget> pages = const [
      ProfileSection(),
      PhotoSection(),
      VideoSection(),
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }
}
