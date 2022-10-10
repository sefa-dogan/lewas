import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learn_english/menuBari.dart';

class LearnedWords extends StatefulWidget {
  const LearnedWords({super.key});

  @override
  State<LearnedWords> createState() => _LearnedWordsState();
}

class _LearnedWordsState extends State<LearnedWords> {
  List<String> learnedWords = [
    "english",
    "room",
    "table",
    "mouse",
    "thread",
    "phone"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          child: Text(
            "Learn English Words And Speak",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          preferredSize: Size(10, 10),
        ),
        title: Center(
            child: Text(
          "LEWAS",
          style: TextStyle(color: Colors.purple, fontSize: 24),
        )),
        automaticallyImplyLeading: false, // yeni bir sayfa açıldığ
      ),
      body: Column(
        children: [
          Text(
            "Learned Words",
            style: TextStyle(fontSize: 24),
          ),
          Expanded(
            child: ListView(
              children: learnedWords
                  .map((word) => Card(
                        child: GestureDetector(
                          child: ListTile(
                            leading: Text(word),
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (alertContext) {
                                
                                return AlertDialog(
                                  title: Text(word + " kelimesinin anlamı"),
                                );
                              },
                            );
                          },
                        ),
                      ))
                  .toList(),
            ),
          ),
          MenuBari().createBar(context)
        ],
      ),
    );
  }
}
