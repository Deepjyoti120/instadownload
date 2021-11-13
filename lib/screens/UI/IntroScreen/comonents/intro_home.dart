import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getprofile/cubit/introscreen_cubit.dart';
import 'package:getprofile/screens/UI/IntroScreen/comonents/intro_content.dart';
import 'package:getprofile/screens/UI/home_screen_new.dart';
import 'package:getprofile/screens/widgets/gradient/getprofile_bg_color.dart';

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
      "text": "Get your Instagram Profile Pic using \nGetProfile!"
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
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  const Spacer(flex: 3),
                  Container(
                    decoration: getProfileBGColor(),
                    child: TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(146.0),
                        ))),
                        onPressed: () {
                          BlocProvider.of<IntroscreenCubit>(context)
                              .introScreenValueDone();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => const NewHomePage()),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(30, 8, 30, 8),
                          child: Text(
                            'Continue',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
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
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: currentPage == index ? 22 : 8,
      decoration: BoxDecoration(
        color: currentPage == index
            ? const Color(0xFF00e0ff)
            : const Color(0xFF581b98),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
