import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:instadownload/screens/widgets/CenterFBtn.dart';
import 'package:instadownload/screens/widgets/searchField.dart';

class PhotoSection extends StatelessWidget {
  const PhotoSection({
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
            "Get Photo",
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
            // SearchField(
            //   labelText: 'ffff'
            // ),
            // SizedBox(
            //   height: 40,
            // ),
            // SearchField(),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                    child: Text('Paste'),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                    child: Text('Verify'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
