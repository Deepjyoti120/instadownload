import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:getprofile/screens/UI/bottomBar/custom_bar.dart';
import 'package:getprofile/screens/whatsapp/video_save.dart';
import 'package:getprofile/screens/whatsapp/photos_save.dart';
import 'package:getprofile/screens/widgets/gradient/text_gradient.dart';

class HomeWPDownload extends StatefulWidget {
  const HomeWPDownload({Key? key}) : super(key: key);

  @override
  _HomeWPDownloadState createState() => _HomeWPDownloadState();
}

class _HomeWPDownloadState extends State<HomeWPDownload> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        automaticallyImplyLeading: false,
        title: const TextGradient(text: "StatusSave"),
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
            title: const Text('Photo')),
        BottomBarItem(
          icon: const Icon(FeatherIcons.film),
          title: const Text('Video'),
          activeColor: Colors.purpleAccent,
        ),
      ],
    );
  }

  Widget getBody() {
    List<Widget> pages = const [
      PhotosDownload(),
      VideoDownload(),
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }
}
