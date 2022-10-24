// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:learn_english/locator.dart';
import 'package:learn_english/model/mobx/register_info.dart';

class RegisterScroll extends StatefulWidget {
  const RegisterScroll({super.key});
  @override
  State<RegisterScroll> createState() => _RegisterScrollState();
}

class _RegisterScrollState extends State<RegisterScroll> {
  final _locatorRegisterInfo = locator<RegisterInfo>();

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
              hintText: "Name",
              labelText: "Name",
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => _locatorRegisterInfo.name = value,
            autofocus: true,
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 40, bottom: 15, top: 10),
          child: TextField(
            decoration: const InputDecoration(
              hintText: "Surname",
              labelText: "Surname",
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => _locatorRegisterInfo.surname = value,
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
            onChanged: (value) => _locatorRegisterInfo.email = value,
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 40, bottom: 15, top: 10),
          child: TextField(
            decoration: const InputDecoration(
              hintText: "Password",
              labelText: "Password",
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => _locatorRegisterInfo.password = value,
          ),
        ),
      ],
    ));
  }
}
