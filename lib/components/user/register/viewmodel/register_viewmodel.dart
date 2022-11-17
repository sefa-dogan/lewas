import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
part 'register_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store {
  @observable
  String name = "";
  @observable
  String surname = "";
  @observable
  String email = "";
  @observable
  String password = "";

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late UserCredential _userCredential;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  registerWithEmailPassword(BuildContext context) async {
    try {
      _userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (_userCredential.user != null) {
        await _firestore
            .doc("students/${_userCredential.user!.uid}")
            .collection("Student Info")
            .doc("Student Info")
            .set({
          "isim": name,
          "soyisim": surname,
          "e-mail": email,
          "daily right": 10,
          "profilePicUrl":
              "https://static9.depositphotos.com/1589661/1139/v/600/depositphotos_11396045-stock-illustration-red-cross-button-refuse-wrong.jpg",
          "Last Online": DateTime.now().day,
        });
        await _firestore
            .doc("students/${_userCredential.user!.uid}")
            .collection("learnedwords")
            .doc("learnedwords")
            .set({});
        await _userCredential.user!.sendEmailVerification();
        Get.offNamed("login-page");
      } else {
        throw Future.error("Kayıt yapılamadı");
      }
    } catch (e) {
      debugPrint(e.toString());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Kayıt oluşturulamadı: $e"),
          );
        },
      );
    }
  }

  setName(value) {
    name = value;
  }

  setSurname(value) {
    surname = value;
  }

  setEmail(value) {
    email = value;
  }

  setPassword(value) {
    password = value;
  }
}
