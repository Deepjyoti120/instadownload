import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:getprofile/screens/UI/bottomBar/custom_bar.dart';
import 'package:getprofile/screens/ui/repost/photos_save.dart';
import 'package:getprofile/screens/ui/repost/video_save.dart';
import 'package:getprofile/screens/widgets/gradient/text_gradient.dart';

class HomeRepost extends StatefulWidget {
  const HomeRepost({Key? key}) : super(key: key);

  @override
  _HomeRepostState createState() => _HomeRepostState();
}

class _HomeRepostState extends State<HomeRepost> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        automaticallyImplyLeading: false,
        title: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Icon(
                FeatherIcons.instagram,
                size: 16,
                color: Colors.purpleAccent,
              ),
            ),
            SizedBox(width: 4),
            TextGradient(
              text: "Repost",
              appbarfontsize: 20,
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
      body: getBody(),
    );
  }

  Widget _buildBottomBar() {
    return CustomBottomBar(
      containerHeight: 60,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeInOutBack,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomBarItem>[
        BottomBarItem(
            icon: const Icon(
              FeatherIcons.image,
            ),
            title: const Text('Photos')),
        BottomBarItem(
          icon: const Icon(FeatherIcons.film),
          title: const Text('Videos'),
          activeColor: Colors.purpleAccent,
        ),
      ],
    );
  }

  Widget getBody() {
    List<Widget> pages = const [
      PhotosDownloaded(),
      VideoDownloaded(),
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }
}
