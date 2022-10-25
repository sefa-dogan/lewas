// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn {
  SignIn(this._email, this._sifre);
  final String _email;
  final String _sifre;
  late UserCredential _userCredential;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> SignInWithEmailPassword(BuildContext context) async {
    _userCredential =
        await _auth.signInWithEmailAndPassword(email: _email, password: _sifre);
    var _user = _userCredential.user;
    if (_user!.emailVerified) {
      return _user.uid;
    } else {
      await _user.sendEmailVerification();
      await _auth.signOut();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
                "${_user.email} adresinize gönderilen onay maili ile hesabınızı doğrulayın"),
          );
        },
      );
      return "";
    }
  }
}
