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
      margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
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
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin:const EdgeInsets.only(top: 4),
            child:const Text("For Security Check Please Confirm you are not a Robot",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
         const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children:const [
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
             const Icon(FeatherIcons.codesandbox, size: 22, color: Colors.white)
            ],
          ),
          Container(
            margin:const EdgeInsets.only(top: 8),
            child:const Text(
                "* Click on Verify Button and Open any Instagram Account",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          Container(
            margin:const EdgeInsets.only(top: 8),
            child: const Text("* Turn On/Off your mobile Data Connection",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          Container(
            alignment: Alignment.center,
            margin:const EdgeInsets.only(top: 8),
            child:const Text("OR",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          Container(
            margin:const EdgeInsets.only(top: 8),
            child:const Text("* Turn On/Off your mobile Airplane Mode",
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
