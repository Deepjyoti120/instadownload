import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getprofile/cubit/introscreen_cubit.dart';
import 'package:getprofile/screens/UI/IntroScreen/comonents/intro_content.dart';
import 'package:getprofile/screens/UI/home_screen_new.dart';

class IntroHome extends StatefulWidget {
  const IntroHome({Key? key}) : super(key: key);

  @override
  _IntroHomeState createState() => _IntroHomeState();
}

class _IntroHomeState extends State<IntroHome> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      
      "image": "assets/images/introProfile1.svg",
      "text": "Get your Instagram Profile Pic using GetProfile!"
    },
    {
      "text":
          "Extract Instagram photos and Share where \nyou want using GetProfile",
      "image": "assets/images/photo.svg"
    },
    {
      "text":
          "Extract Instagram Videos, Reels and Share them to \nwhere you want using GetProfile",
      "image": "assets/images/video.svg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children:[
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  const Spacer(flex: 3),
                  TextButton(
                      onPressed: () {
                        BlocProvider.of<IntroscreenCubit>(context)
                            .introScreenValueDone();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => const NewHomePage()),
                        );
                      },
                      child: const Text('data')),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index
            ? const Color(0xFFD8D8df)
            : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
