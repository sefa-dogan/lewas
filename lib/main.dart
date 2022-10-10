import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/forgot_password.dart';
import 'package:learn_english/home_page.dart';
import 'package:learn_english/learned_words.dart';
import 'package:learn_english/menuBari.dart';
import 'package:learn_english/register.dart';
import 'package:learn_english/user_informations.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginPage(), theme: ThemeData.light());
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Kullanıcı adı",
                labelText: "Kullanıcı adı",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Şifre",
                  labelText: "Şifre"),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (forgotPasswordContext) => ForgotPassword()));
                },
                child: Text("Şifremi unuttum"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 40),
              child: TextButton(
                // style: ButtonStyle(
                //     minimumSize: MaterialStateProperty.all(Size(300, 20))),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (registerContext) => Register()));
                },
                child: Text(
                  "Kayıt ol",
                  style: TextStyle(color: Colors.blue),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ]),
          ElevatedButton.icon(
              onPressed: () {
                
                Navigator.pushReplacement(
                    // Navigator.pushReplacement sınıfı ile bir sayfaya gidildiğinde, geri gelmek mümkün olmayacaktır.
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              icon: Icon(Icons.key),
              label: Text("Oturum aç")),
        ],
      ),
    );
  }
}

class Sefa {
  String deger="";
  String deger1="";
}

