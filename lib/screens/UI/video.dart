import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:instadownload/screens/widgets/CenterFBtn.dart';

class VideoSection extends StatelessWidget {
  const VideoSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            "Get Video",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
