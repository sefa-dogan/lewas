import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/widgets/menuBari.dart';

class UserInformations extends StatefulWidget {
  const UserInformations({super.key});

  @override
  State<UserInformations> createState() => _UserInformationsState();
}

class _UserInformationsState extends State<UserInformations> {
  late String _isim;
  late String _soyisim;
  late String _email;
  bool aktiflik = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // ignore: prefer_typing_uninitialized_variables
  var _user;
  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
  }

  @override
  Widget build(BuildContext userInfocontext) {
    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
          // ignore: sort_child_properties_last
          child: Text(
            "Learn English Words And Speak",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          preferredSize: Size(10, 10),
        ),
        title: const Center(
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
              icon: const Icon(Icons.edit))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Stack(children: [
              const SizedBox(
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
                  icon: const Icon(Icons.edit),
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
                        onPressed: () async {
                          await _firestore
                              .doc("students/${_user.uid}")
                              .collection("Student Info")
                              .doc("Student Info")
                              .set({
                            "isim": _isim,
                            "soyisim": _soyisim,
                            "e-mail": _email,
                          }, SetOptions(merge: true));
                          aktiflik = false;
                          setState(() {});
                          await _auth.currentUser!.updateEmail(_email);
                        },
                        child: const Text("Güncelle")),
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

  // ignore: non_constant_identifier_names
  SingleChildScrollView TextFieldColumnForUsers(durum) {
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
            onChanged: (value) => _isim = value,
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
            onChanged: (value) => _soyisim = value,
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
            onChanged: (value) => _email = value,
          ),
        ),
      ],
    ));
  }
}
