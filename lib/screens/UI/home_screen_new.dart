import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:getprofile/screens/UI/photo.dart';
import 'package:getprofile/screens/UI/profile.dart';
import 'package:getprofile/screens/UI/video.dart';
import 'package:getprofile/screens/widgets/gradient/text_gradient.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({Key? key}) : super(key: key);

  @override
  _NewHomePageState createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    ProfileSection(),
    PhotoSection(),
    VideoSection(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        automaticallyImplyLeading: false,
        title: const TextGradient(text: "Getprofile"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.userCheck),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.camera),
            label: 'Photo',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.film),
            label: 'Reels',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey[900],
        onTap: _onItemTapped,
        showUnselectedLabels: false,
        
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
