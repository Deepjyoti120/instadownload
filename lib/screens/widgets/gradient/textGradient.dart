import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getprofile/screens/widgets/gradient/gradientStyle.dart';
import 'package:google_fonts/google_fonts.dart';

class TextGradient extends StatelessWidget {
  final String text;
  const TextGradient({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientStyle(
      text,
      gradient: RadialGradient(
        center: Alignment(0.54, 1.19),
        radius: 0.953,
        colors: [
          const Color(0xFFFFDD55),
          const Color(0xFFFFE477),
          const Color(0xFFFF8D7E),
          const Color(0xFFE825C1)
        ],
        stops: [0.0, 0.127, 0.492, 1.0],
      ),
      style: GoogleFonts.oleoScriptSwashCaps(fontSize: 26, color: Colors.black),
    );
  }
}