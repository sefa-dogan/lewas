// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
part 'forgot_password_viewmodel.g.dart';

class ForgotPasswordViewModel = _ForgotPasswordViewModelBase
    with _$ForgotPasswordViewModel;

abstract class _ForgotPasswordViewModelBase with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @observable
  late String email = "";

  @action
  forgotPassword(BuildContext context) async {
    try {
      await _auth
          .sendPasswordResetEmail(email: email)
          .timeout(const Duration(seconds: 3));
      await Get.offNamed("login-page");
    } on NullThrownError catch (nullEx) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("E-mailinizi girdikten sonra işlem yapınız: $nullEx"),
        ),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Bir hata ile karşılaşıldı"),
        ),
      );
    }
  }

  setEmail(value) {
    email = value;
  }
}
