import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "LEWAS",
            style: TextStyle(fontSize: 24),
          ),
        ),
        bottom: const PreferredSize(
          // ignore: sort_child_properties_last
          child: Text(
            "Learn English Words And Speak",
            style: TextStyle(color: Colors.purple, fontSize: 16),
          ),
          preferredSize: Size(10, 10),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter your e-mail address"),
                  onChanged: (value) => _email = value,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
                alignment: Alignment.topCenter,
                child: ElevatedButton(
                    onPressed: () async {
                      try {
                        await _auth
                            .sendPasswordResetEmail(email: _email)
                            .timeout(const Duration(seconds: 3));
                      } catch (e) {
                        showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                            title: Text("Bir hata ile karşılaşıldı"),
                          ),
                        );
                      }
                    },
                    child: const Text("Send Reset E-mail"))),
          )
        ],
      ),
    );
  }
}
