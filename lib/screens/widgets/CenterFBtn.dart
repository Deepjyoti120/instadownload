import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CenterFloatingActionButton extends StatelessWidget {
  final Icon icon;
  final Text titleText;
  const CenterFloatingActionButton({
    Key? key,
    required this.icon,
    required this.titleText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      label: Row(
        children: [
          icon,
          Container(
            margin: EdgeInsets.only(left: 4),
            child: titleText,
          ),
        ],
      ),
    );
  }
}
