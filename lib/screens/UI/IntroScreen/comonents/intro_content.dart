import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getprofile/screens/widgets/gradient/text_gradient.dart';

class SplashContent extends StatelessWidget {
  final String? text, image;
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Column(
      children: [
        const Spacer(),
        const TextGradient(
          text: "GetProfile",
        ),
        Text(
          text!,
          style: const TextStyle(fontSize: 16.0),
          textAlign: TextAlign.center,
        ),
        const Spacer(flex: 1),
        SvgPicture.asset(
          image!,
          width: orientation ? 0 : 350,
        ),
      ],
    );
  }
}
