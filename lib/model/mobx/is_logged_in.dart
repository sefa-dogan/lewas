// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/locator.dart';
import 'package:learn_english/model/mobx/profile_image.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'is_logged_in.g.dart';

class IsLoggedInMobx = _IsLoggedInBase with _$IsLoggedInMobx;
final _locatorPImage = locator<ProfileImage>();

abstract class _IsLoggedInBase with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late SharedPreferences _prefs;

  @observable
  String? email;
  @observable
  String? sifre;
  @observable
  bool screen = false;

  @action
  // ignore: no_leading_underscores_for_local_identifiers
  Future<void> setAndSaveEmailAndSifre(String _email, String _sifre) async {
    _prefs = await SharedPreferences.getInstance();
    email = _email;
    sifre = _sifre;
    _prefs.setString("mailAdress", email ?? "");
    _prefs.setString("sifre", sifre ?? "");
    screen = true;

    // debugPrint(prefs.getString("mailAdress"));
  }

  @action
  Future<void> isLoggedInOrNot() async {
    _prefs = await SharedPreferences.getInstance();
    email = _prefs.getString("mailAdress") ?? "";
    sifre = _prefs.getString("sifre") ?? "";
    debugPrint(
        "*******/*///*/*/*/*/*/*/*/*/*/*/****************************************");
    debugPrint("$email, $sifre");
    if (email != "" && sifre != "") {
      await _auth.signInWithEmailAndPassword(email: email!, password: sifre!);
      await _locatorPImage.GetUserProfilePicture();

      screen = true; //HomePage e yönlendirir
    } else {
      screen = false; //LoginScreen e yönlendirir
    }
  }
}
