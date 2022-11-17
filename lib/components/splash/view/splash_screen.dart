import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_english/locator.dart';
import 'package:learn_english/store/is_logged_in_viewmodel.dart';

class SplassScreen extends StatefulWidget {
  const SplassScreen({super.key});

  @override
  State<SplassScreen> createState() => _SplassScreenState();
}

final viewModelIsLoggedIn = locator<IsLoggedInViewModel>();

class _SplassScreenState extends State<SplassScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () {
        viewModelIsLoggedIn.screen
            ? Get.offNamed("home-page")
            : Get.offNamed("login-page");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 144, 138, 138),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Image(
              image: AssetImage('assets/learn.jpg'),
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "LEWAS",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
