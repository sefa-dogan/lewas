// ignore_for_file: unused_field, use_build_context_synchronously

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_english/model/mobx/is_logged_in.dart';
import 'package:learn_english/operations/sign_in_operations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email;
  late String _sifre;
  late UserCredential _userCredential;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late final String _userID;
  final IsLoggedInMobx _isLoggedIn = IsLoggedInMobx();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size(10, 10),
          child: Text(
            "Learn English Words And Speak",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        title: const Center(
            child: Text(
          "LEWAS",
          style: TextStyle(color: Colors.purple, fontSize: 24),
        )),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
            child: TextField(
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "E-mail",
                labelText: "E-mail",
              ),
              onChanged: (value) => _email = value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
            child: TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Password",
                    labelText: "Password"),
                onChanged: (value) => _sifre = value,
                obscureText: true),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: TextButton(
                onPressed: () {
                  Get.toNamed("forgotpassword");
                },
                child: const Text("Forgot password"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: TextButton(
                onPressed: () {
                  Get.toNamed("register");
                },
                child: const Text(
                  "Register",
                  style: TextStyle(color: Colors.blue),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ]),
          ElevatedButton.icon(
              onPressed: () async {
                try {
                  _userID = await SignIn(_email, _sifre)
                      .SignInWithEmailPassword(context)
                      .timeout(const Duration(seconds: 20));
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  if (_userID.isNotEmpty) {
                    await _isLoggedIn.setAndSaveEmailAndSifre(_email, _sifre);
                    Get.offNamed("homepage");

                    var email = prefs.getString("mailAdress");
                    if (email != null) {
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                                "$email ile giriş yapıldı ve rame kaydedildi"),
                          );
                        },
                      );
                    } else {
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text("mail adresi kaydedilmedi"),
                          );
                        },
                      );
                    }
                  }
                } on FirebaseAuthException catch (e) {
                  debugPrint(e.toString());
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        title: Text(
                            "E-mail ya da şifre yanlış. Kontrol ettikten sonra tekrar deneyin"),
                      );
                    },
                  );
                } on TimeoutException catch (e) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // ignore: prefer_interpolation_to_compose_strings
                        title: Text("Oturum açma işlemi çok uzun sürdü: " +
                            e.toString()),
                      );
                    },
                  );
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title:
                            // ignore: prefer_interpolation_to_compose_strings
                            Text("Bir sorunla karşılaşıldı: " + e.toString()),
                      );
                    },
                  );
                }
              },
              icon: const Icon(Icons.key),
              label: const Text("Login")),
        ],
      ),
    );
  }
}
