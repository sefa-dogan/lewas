import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learn_english/menuBari.dart';

class UserInformations extends StatefulWidget {
  UserInformations({super.key});

  @override
  State<UserInformations> createState() => _UserInformationsState();
}

class _UserInformationsState extends State<UserInformations> {
  List<String> userInformation = [
    "Sefa",
    "Doğan",
    "1998",
    "sefadoan6@gmail.com",
    "123123",
    "123123",
    "123123",
    "123123",
    "123123",
    "123123",
    "123123",
    "123123",
    "123123",
    "123123",
    "123123",
  ];
  bool aktiflik = false;

  @override
  Widget build(BuildContext userInfocontext) {
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
        automaticallyImplyLeading:
            false, // yeni bir sayfa açıldığı zaman geriye dönmek için appbara yerleştirilen butonun yerleştirilmesini önler.
        actions: [
          IconButton(
              onPressed: () {
                aktiflik = true;
                setState(() {});
              },
              icon: Icon(Icons.edit))
        ],
      ),
      body: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            child: Stack(children: [
              Container(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/ben7.JPG"),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  color: Colors.grey,
                  onPressed: () {},
                  icon: Icon(Icons.edit),
                ),
              ),
            ]),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Expanded(
                child: Column(
                  children: [
                    TextFieldColumnForUsers(aktiflik),
                    ElevatedButton(
                        onPressed: () {
                          aktiflik = false;
                          setState(() {});
                        },
                        child: Text("Güncelle")),
                  ],
                ),
              ),
            ),
          ),
          MenuBari().createBar(userInfocontext)
        ],
      ),
    );
  }

  Column TextFieldColumnForUsers(durum) {
    return Column(
      children: userInformation
          .map((info) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: info,
                    border: OutlineInputBorder(),
                  ),
                  enabled: durum,
                ),
              ))
          .toList(),
    );
  }
}
