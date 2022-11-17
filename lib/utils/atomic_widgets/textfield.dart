// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class GenericTextField extends StatelessWidget {
  GenericTextField({
    super.key,
    required this.text,
    required this.onChangedValue,
    this.autoFocus = false,
    this.textEditingController,
    this.isActive = true,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
  });

  String text;
  Function(String value) onChangedValue;
  TextEditingController? textEditingController;
  bool autoFocus;
  bool isActive;
  double left;
  double right;
  double top;
  double bottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
      child: TextField(
        controller: textEditingController,
        autofocus: true,
        decoration: InputDecoration(
          enabled: isActive,
          border: const OutlineInputBorder(),
          hintText: text,
          labelText: text,
        ),
        onChanged: (value) => onChangedValue(value),
      ),
    );
  }
}
