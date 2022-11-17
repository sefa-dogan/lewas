// ignore_for_file: no_leading_underscores_for_local_identifiers, library_private_types_in_public_api

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_english/locator.dart';
import 'package:learn_english/store/is_logged_in_viewmodel.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_viewmodel.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  final _isLoggedInViewModel = locator<IsLoggedInViewModel>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late UserCredential _userCredential;
  late String email = "";
  late String password = "";

  late SharedPreferences _prefs;

  signInWithEmailPassword(BuildContext context) async {
    try {
      _userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .timeout(const Duration(seconds: 7));
      var _user = _userCredential.user;
      if (_user!.emailVerified) {
        await setAndSaveEmailAndSifre();
        await Get.offNamed("home-page");
      } else {
        await _user.sendEmailVerification();
        await _auth.signOut();
        Get.dialog(SimpleDialog(
          title: Text(
              "${_user.email} adresinize gönderilen onay maili ile hesabınızı doğrulayın"),
        ));
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      Get.dialog(SimpleDialog(
        title: Text(
            "E-mail ya da şifre yanlış. Kontrol ettikten sonra tekrar deneyin. Hata: ${e.message}"),
      ));
    } on TimeoutException catch (e) {
      Get.dialog(SimpleDialog(
        title: Text("Oturum açma işlemi çok uzun sürdü: $e"),
      ));
    } catch (e) {
      Get.dialog(SimpleDialog(
        title: Text("Bir sorunla karşılaşıldı: $e "),
      ));
    }
  }

  setAndSaveEmailAndSifre() async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setString("mailAdress", email);
    _prefs.setString("sifre", password);
    _isLoggedInViewModel.screen = true;
    // ignore: use_build_context_synchronously
    await isSavedEmailAndPassword();
  }

  isSavedEmailAndPassword() async {
    var _email = _prefs.getString("mailAdress");

    if (_email != null) {
      Get.dialog(SimpleDialog(
        title: Text("$_email ile giriş yapıldı ve rame kaydedildi"),
      ));
    } else {
      Get.dialog(const SimpleDialog(
        title: Text("mail adresi kaydedilmedi"),
      ));
    }
  }

  setEmail(value) {
    email = value;
  }

  setPassword(value) {
    password = value;
  }
}
