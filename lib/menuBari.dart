import 'package:flutter/material.dart';
import 'package:learn_english/home_page.dart';
import 'package:learn_english/learned_words.dart';
import 'package:learn_english/user_informations.dart';

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
              if (Navigator.canPop(context)) {
                Navigator.maybePop(context);
              }
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
            },
            child: Icon(Icons.home, color: Colors.black, shadows: [
              Shadow(color: Colors.grey, blurRadius: 10, offset: Offset.zero)
            ]),
            clipBehavior: Clip.antiAliasWithSaveLayer,
          ),
        ),
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shadowColor: MaterialStateProperty.all(Colors.white)),
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.maybePop(context);
              }
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => LearnedWords(),
              ));
            },
            child: Icon(
                Icons
                    .checklist, // öğrenilmiş kelimelere bu buton sayesinde gidilir.
                color: Colors.black,
                shadows: [
                  Shadow(
                      color: Colors.grey, offset: Offset.zero, blurRadius: 10)
                ]),
            clipBehavior: Clip.antiAliasWithSaveLayer,
          ),
        ),
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shadowColor: MaterialStateProperty.all(Colors.white)),
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.maybePop(context);
              }
              Navigator.of(context).push(MaterialPageRoute(
                builder: (userInformationsContext) => UserInformations(),
              ));
            },
            child:
                Icon(Icons.admin_panel_settings, color: Colors.black, shadows: [
              Shadow(color: Colors.grey, offset: Offset.zero, blurRadius: 10)
            ]),
            clipBehavior: Clip.antiAliasWithSaveLayer,
          ),
        )
      ],
    );
  }
}
