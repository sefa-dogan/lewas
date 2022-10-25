// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuBari {
  Row createBar(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shadowColor: MaterialStateProperty.all(Colors.white)),
            onPressed: () {
              Get.offNamed("homepage");
            },
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: const Icon(Icons.home, color: Colors.black, shadows: [
              Shadow(color: Colors.grey, blurRadius: 10, offset: Offset.zero)
            ]),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shadowColor: MaterialStateProperty.all(Colors.white)),
            onPressed: () {
              Get.offNamed("learnedpage");
            },
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: const Icon(
                Icons
                    .checklist, // öğrenilmiş kelimelere bu buton sayesinde gidilir.
                color: Colors.black,
                shadows: [
                  Shadow(
                      color: Colors.grey, offset: Offset.zero, blurRadius: 10)
                ]),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shadowColor: MaterialStateProperty.all(Colors.white)),
            onPressed: () {
              Get.offNamed("userinformationspage");
            },
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: const Icon(Icons.admin_panel_settings,
                color: Colors.black,
                shadows: [
                  Shadow(
                      color: Colors.grey, offset: Offset.zero, blurRadius: 10)
                ]),
          ),
        )
      ],
    );
  }
}
