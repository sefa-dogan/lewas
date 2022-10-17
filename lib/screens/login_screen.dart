// ignore_for_file: unused_field, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/operations/sign_in_operations.dart';
import 'package:learn_english/screens/forgot_password_screen.dart';
import 'package:learn_english/screens/home_page_screen.dart';
import 'package:learn_english/screens/register_screen.dart';

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
                    hintText: "Şifre",
                    labelText: "Şifre"),
                onChanged: (value) => _sifre = value,
                obscureText: true),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (forgotPasswordContext) =>
                          const ForgotPassword(),
                    ),
                  );
                },
                child: const Text("Şifremi unuttum"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: TextButton(
                // style: ButtonStyle(
                //     minimumSize: MaterialStateProperty.all(Size(300, 20))),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (registerContext) => const Register(),
                    ),
                  );
                },
                child: const Text(
                  "Kayit ol",
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
                      .SignInWithEmailPassword(context);
                  if (_userID.isNotEmpty) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  }
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(e.toString()),
                      );
                    },
                  );
                }
              },
              icon: const Icon(Icons.key),
              label: const Text("Oturum aç")),
        ],
      ),
    );
  }
}
