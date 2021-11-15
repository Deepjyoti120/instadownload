import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:getprofile/screens/widgets/gradient/gradient_style.dart';

class TextGradient extends StatelessWidget {
  final String text;
  final double appbarfontsize;
  const TextGradient({
    Key? key,
    required this.text,
    required this.appbarfontsize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientStyle(
      text,
      gradient: const RadialGradient(
        center: Alignment(0.54, 1.19),
        radius: 0.953,
        colors: [
          Color(0xFFFFDD55),
          Color(0xFFFFE477),
          Color(0xFFFF8D7E),
          Color(0xFFE825C1)
        ],
        stops: [0.0, 0.127, 0.492, 1.0],
      ),
      style: GoogleFonts.balooBhaina(fontSize: appbarfontsize, color: Colors.black),
    );
  }
}
