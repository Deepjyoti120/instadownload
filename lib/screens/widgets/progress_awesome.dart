import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

SizedBox progressAwesome() {
  return const SizedBox(
    height: 26,
    width: 26,
    child: CircularProgressIndicator(
      strokeWidth: 1.5,
    ),
  );
}
