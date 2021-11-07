import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class TipsWidget extends StatelessWidget {
  const TipsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
      padding: EdgeInsets.fromLTRB(18, 20, 18, 20),
      // decoration: BoxDecoration(
      //   color: Color(0xff8E55FD),
      //   borderRadius: BorderRadius.all(Radius.circular(6)),
      // ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
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
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 4),
            // width: 100,
            child: Text("For Security Check Please Confirm you are not a Robot",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("Pro Tips-",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SizedBox(
                    width: 4,
                  ),
                  Text("if Download Not Start",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ],
              ),
              Icon(FeatherIcons.codesandbox, size: 22, color: Colors.white)
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            // width: 100,
            child: Text(
                "* Click on Verify Button and Open any Instagram Account",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            // width: 100,
            child: Text("* Turn On/Off your mobile Data Connection",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 8),
            // width: 100,
            child: Text("OR",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            // width: 100,
            child: Text("* Turn On/Off your mobile Airplane Mode",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
