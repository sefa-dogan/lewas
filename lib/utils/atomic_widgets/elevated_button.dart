// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class GenericElevatedButton extends StatelessWidget {
  GenericElevatedButton(
      {super.key, required this.childWidget, required this.onPressedFunc});

  VoidCallback? onPressedFunc;
  Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedFunc,
      child: childWidget,
    );
  }
}
