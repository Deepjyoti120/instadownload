import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getprofile/ads/ads_helper.dart';
import 'package:getprofile/screens/UI/bottomBar/custom_bar.dart';
import 'package:getprofile/screens/ui/repost/home.dart';
import 'package:getprofile/screens/UI/photo.dart';
import 'package:getprofile/screens/UI/profile.dart';
import 'package:getprofile/screens/UI/video.dart';
import 'package:getprofile/screens/whatsapp/home.dart';
import 'package:getprofile/screens/widgets/gradient/text_gradient.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

final interstitialAd = InterstitialAd(unitId: AdsHelper.interstitialAds);

class NewHomePage extends StatefulWidget {
  const NewHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NewHomePage> {
  int _currentIndex = 0;
  @override
  void initState() {
    if (!interstitialAd.isLoaded) interstitialAd.load();
    interstitialAd.onEvent.listen((e) {
      final event = e.keys.first;
      switch (event) {
        case FullScreenAdEvent.closed:
          interstitialAd.load();
          break;
        default:
          break;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        automaticallyImplyLeading: false,
        title: const TextGradient(
          text: "Getprofile",
          appbarfontsize: 26,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              photoNavigate();
              if (!interstitialAd.isAvailable) await interstitialAd.load();
              if (interstitialAd.isAvailable) {
                await interstitialAd.show();
              }
            },
            icon: SvgPicture.asset(
              'assets/images/wp.svg',
              width: 24,
              color: Colors.blueGrey,
            ),
          ),
          IconButton(
            onPressed: () async {
              iNavigate();
              if (!interstitialAd.isAvailable) await interstitialAd.load();
              if (interstitialAd.isAvailable) {
                await interstitialAd.show();
              }
            },
            icon: const Icon(FeatherIcons.download),
            color: Colors.blueGrey,
          )
        ],
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
      curve: Curves.easeInOutBack,
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

  void photoNavigate() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      try {
        await Permission.storage.request();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeWPDownload(),
          ),
        );
        // ignore: empty_catches
      } catch (e) {}
    }
  }

  void iNavigate() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      try {
        await Permission.storage.request();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeRepost(),
          ),
        );
        // ignore: empty_catches
      } catch (e) {}
    }
  }
}
