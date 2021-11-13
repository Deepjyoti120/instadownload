import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getprofile/screens/UI/IntroScreen/comonents/intro_home.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key); 
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IntroHome(),
    );
  }
}
