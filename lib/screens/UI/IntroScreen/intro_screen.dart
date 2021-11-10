import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart'; 
import 'package:getprofile/cubit/introscreen_cubit.dart';
import 'package:getprofile/screens/UI/home_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroInsta extends StatefulWidget {
  const IntroInsta({Key? key}) : super(key: key);

  @override
  _IntroInstaState createState() => _IntroInstaState();
}

class _IntroInstaState extends State<IntroInsta> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    BlocProvider.of<IntroscreenCubit>(context).introScreenValueDone();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) =>const MainInsta()),
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return SvgPicture.asset(assetName, width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 16.0);
    const pageDecoration =   PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 26,
        color: Colors.black,
        fontFamily: 'Oleo_Script_Swash_Caps',
      ),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      // globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Get profile",
          body: "Get your Instagram Profile Pic using GetProfile",
          image:
              SafeArea(child: _buildImage('assets/images/introProfile1.svg')),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Get photos",
          body:
              "Extract Instagram photos and Share where you want using GetProfile",
          image: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: _buildImage('assets/images/photo.svg'),
          )),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Get videos",
          body:
              "Extract Instagram Videos, Reels and Share them to  where you want using GetProfile",
          image: Padding(
            padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
            child: SafeArea(child: _buildImage('assets/images/video.svg')),
          ),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.black45,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(),
      ),
    );
  }
}
