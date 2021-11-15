import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getprofile/screens/widgets/gradient/gradient_style.dart';
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
      style: GoogleFonts.balooBhaina(fontSize: 26, color: Colors.black),
    );
  }
}
