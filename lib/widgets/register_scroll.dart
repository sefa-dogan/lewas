// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class RegisterScroll extends StatefulWidget {
  RegisterScroll({
    super.key,
    this.name = "",
    this.surname = "",
    this.email = "",
    this.password = "",
  });

  String name;
  String surname;
  String email;
  String password;

  @override
  State<RegisterScroll> createState() => _RegisterScrollState();
}

class _RegisterScrollState extends State<RegisterScroll> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 40, bottom: 15, top: 10),
          child: TextField(
            decoration: const InputDecoration(
              hintText: "İsim",
              labelText: "İsim",
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => widget.name = value,
            autofocus: true,
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 40, bottom: 15, top: 10),
          child: TextField(
            decoration: const InputDecoration(
              hintText: "Soyisim",
              labelText: "Soyisim",
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => widget.surname = value,
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 40, bottom: 15, top: 10),
          child: TextField(
            decoration: const InputDecoration(
              hintText: "E-mail",
              labelText: "E-mail",
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => widget.email = value,
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 40, bottom: 15, top: 10),
          child: TextField(
            decoration: const InputDecoration(
              hintText: "Şifre",
              labelText: "Şifre",
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => widget.password = value,
          ),
        ),
      ],
    ));
  }
}
