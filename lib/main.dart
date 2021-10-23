import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:instadownload/screens/UI/photo.dart';
import 'package:instadownload/screens/UI/profile.dart';
import 'package:instadownload/screens/UI/video.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insta Export',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      appBar: AppBar(title: Text("Insta Export")),
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
