// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class LocalTextButton extends StatelessWidget {
  LocalTextButton(
      {super.key,
      required this.childWidget,
      required this.onPressedFunc,
      this.left = 0,
      this.right = 0,
      this.bottom = 0,
      this.top = 0});

  VoidCallback onPressedFunc;
  Widget childWidget;
  double left;
  double right;
  double top;
  double bottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
      child: TextButton(
        onPressed: onPressedFunc,
        child: childWidget,
      ),
    );
  }
}
