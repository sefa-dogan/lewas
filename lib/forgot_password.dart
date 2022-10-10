import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "LEWAS",
            style: TextStyle(fontSize: 24),
          ),
        ),
        bottom: PreferredSize(
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
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "E-mail adresinizi giriniz")),
              ),
            ),
          ),
          Expanded(
            child: Container(
                alignment: Alignment.topCenter,
                child: ElevatedButton(
                    onPressed: () {}, child: Text("Kod gönder"))),
          )
        ],
      ),
    );
  }
}
