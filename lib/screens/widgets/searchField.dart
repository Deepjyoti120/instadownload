import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class SearchField extends StatelessWidget {
  final TextEditingController pasteValue;
  final String labelText;
  const SearchField({
    Key? key,
    required this.pasteValue,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: pasteValue,
      // cursorColor: Colors.yellow,
      // style: TextStyle(
      //   color: Colors.blue,
      // ),
      decoration: InputDecoration(
        labelText: '$labelText',
        filled: true,
        fillColor: Colors.white,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        contentPadding: EdgeInsets.all(16),
        prefixIcon: Icon(
          FeatherIcons.search,
          color: Colors.black,
          size: 18,
        ),
        focusedBorder: const OutlineInputBorder(
          // 0xFF
          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 1.0),
          // borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        // border: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.blue, width: 0.0),
        //   borderRadius: BorderRadius.all(Radius.circular(4.0)),
        // ),
      ),
    );
  }
}
