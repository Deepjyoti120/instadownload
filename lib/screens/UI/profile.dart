import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:instadownload/screens/widgets/CenterFBtn.dart';
import 'package:instadownload/screens/widgets/searchField.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: FloatingActionBtn(
          icon: Icon(
            FeatherIcons.arrowDownCircle,
            // FeatherIcons.download,
            color: Colors.white,
            size: 18,
          ),
          titleText: Text(
            "Get Profile",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 26.0,
        ),
        child: Column(
          children: [
            SearchField(),
            SizedBox(
              height: 40,
            ),
            SearchField(),
          ],
        ),
      ),
    );
  }
}
