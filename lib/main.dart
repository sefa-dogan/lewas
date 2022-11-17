
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/components/my_app/view/my_app.dart';
import 'package:learn_english/firebase_options.dart';
import 'package:learn_english/locator.dart';

import 'package:learn_english/store/is_logged_in_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setup();
  await viewModelIsLoggedIn.isLoggedInOrNot();

  runApp(const MyApp());
}

final viewModelIsLoggedIn = locator<IsLoggedInViewModel>();

// ignore: must_be_immutable

