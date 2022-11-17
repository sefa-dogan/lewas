// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_english/locator.dart';
import 'package:learn_english/store/is_logged_in_viewmodel.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'user_informations_viewmodel.g.dart';

class UserInformationsViewModel = _UserInformationsViewModelBase
    with _$UserInformationsViewModel;

abstract class _UserInformationsViewModelBase with Store {
  final _isLoggedInViewModel = locator<IsLoggedInViewModel>();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage profileRef = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  late SharedPreferences prefs;
  @observable
  bool activity = false;
  @observable
  Map<String, dynamic> userInformations = {};

  @observable
  String name = " ";
  @observable
  String surname = " ";
  @observable
  String email = " ";
  @observable
  TextEditingController controllerName = TextEditingController();
  @observable
  TextEditingController controllerSurname = TextEditingController();
  @observable
  TextEditingController controllerEmail = TextEditingController();
  @observable
  XFile? _file;
  @observable
  ImageProvider<Object>? pic;

  @action
  // ignore: non_constant_identifier_names
  getUserInformations() async {
    var userID = _auth.currentUser!.uid;
    userInformations = (await _firestore
            .doc("students/$userID/Student Info/Student Info")
            .get())
        .data()!;
    name = userInformations["isim"];
    controllerName.text = name;
    surname = userInformations["soyisim"];
    controllerSurname.text = surname;
    email = userInformations["e-mail"];
    controllerEmail.text = email;
    pic = NetworkImage(userInformations["profilePicUrl"]);
  }

  @action
  // ignore: non_constant_identifier_names
  updateUserInformations() async {
    var userID = _auth.currentUser!.uid;
    await _firestore
        .doc("students/$userID")
        .collection("Student Info")
        .doc("Student Info")
        .set({
      "isim": name,
      "soyisim": surname,
      "e-mail": email,
    }, SetOptions(merge: true));
    controllerName.text = name;
    controllerSurname.text = surname;
    controllerEmail.text = email;

    activity = false;
    await _auth.currentUser!.updateEmail(email);
  }

  @action
  // ignore: non_constant_identifier_names
  uploadPictureToFirebaseStorage(String path) async {
    var userId = _auth.currentUser!.uid;
    // ignore: no_leading_underscores_for_local_identifiers
    var _task =
        profileRef.ref("usersProfileImages/$userId").putFile(File(path));
    await _task.whenComplete(() async {
      // ignore: no_leading_underscores_for_local_identifiers
      var _url =
          await profileRef.ref("usersProfileImages/$userId").getDownloadURL();
      _firestore
          .doc("students/$userId")
          .collection("Student Info")
          .doc("Student Info")
          .set({"profilePicUrl": _url.toString()}, SetOptions(merge: true));
    });
  }

  @action
  // ignore: non_constant_identifier_names
  getUserProfilePicture() async {
    var userID = _auth.currentUser!.uid;
    var result = (await _firestore
            .doc("students/$userID/Student Info/Student Info")
            .get())
        .data();
    if (result != null && result["profilePicUrl"] != null) {
      pic = NetworkImage(result["profilePicUrl"]);
    } else {
      return await Future.error("Belirtilen adres null gönderdi");
    }
  }

  @action
  uploadProfilePicture(BuildContext context) async {
    XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      await uploadPictureToFirebaseStorage(file.path);
      await getUserProfilePicture();
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text("Profil fotoğrafınız başarıyla yüklendi"),
            );
          });
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Profil fotoğrafınız yüklenmedi"),
          );
        },
      );
    }
  }

  @action
  signOut() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString("mailAdress", "");
    prefs.setString("sifre", "");
    await _auth.signOut();
    _isLoggedInViewModel.screen = false;
  }

  setName(String value) {
    name = value;
  }

  setSurname(String value) {
    surname = value;
  }

  setEmail(String value) {
    email = value;
  }
}
