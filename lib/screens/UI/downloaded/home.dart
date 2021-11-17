import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:getprofile/screens/UI/bottomBar/custom_bar.dart';
import 'package:getprofile/screens/UI/downloaded/photos_save.dart';
import 'package:getprofile/screens/UI/downloaded/video_save.dart';
import 'package:getprofile/screens/widgets/gradient/text_gradient.dart';

class HomeIDownload extends StatefulWidget {
  const HomeIDownload({Key? key}) : super(key: key);

  @override
  _HomeIDownloadState createState() => _HomeIDownloadState();
}

class _HomeIDownloadState extends State<HomeIDownload> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        automaticallyImplyLeading: false,
        title: const TextGradient(
          text: "I Downloaded",
          appbarfontsize: 24,
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
