// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/screens/login_screen.dart';

class RegisterOperations {
  RegisterOperations(this._isim, this._soyisim, this._email, this._password);
  final String _isim;
  final String _soyisim;
  final String _email;
  final String _password;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late UserCredential _userCredential;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void registerWithEmailPassword(BuildContext context) async {
    try {
      _userCredential = await _auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      if (_userCredential.user != null) {
        await _firestore
            .doc("students/${_userCredential.user!.uid}")
            .collection("Student Info")
            .doc("Student Info")
            .set({
          "isim": _isim,
          "soyisim": _soyisim,
          "e-mail": _email,
          "daily right": 10,
          "Last Online": DateTime.now().day,
        });
        await _userCredential.user!.sendEmailVerification();
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ));
      } else {
        throw Future.error("Kayıt yapılamadı");
      }
    } catch (e) {
      debugPrint(e.toString());
      return Future.error(e.toString());
    }
  }
}
