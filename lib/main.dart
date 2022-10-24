import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:learn_english/firebase_options.dart';
import 'package:learn_english/locator.dart';
import 'package:learn_english/model/mobx/is_logged_in.dart';
import 'package:learn_english/screens/forgot_password_screen.dart';
import 'package:learn_english/screens/home_page_screen.dart';
import 'package:learn_english/screens/login_screen.dart';
import 'package:learn_english/screens/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Setup();

  await _locator.isLoggedInOrNot();
  runApp(const MyApp());
}

final _locator = locator<IsLoggedInMobx>();

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "LEWAS",
        home: Observer(
          builder: (_) {
            return _locator.screen == true
                ? const HomePage()
                : const LoginScreen();
          },
        ),
        theme: ThemeData.light(),
        getPages: [
          GetPage(
            name: "/homepage",
            page: () => const HomePage(),
          ),
          GetPage(name: "/loginpage", page: () => const LoginScreen()),
          GetPage(
            name: "/forgotpassword",
            page: () => ForgotPassword(),
          ),
          GetPage(name: "/register", page: () => const Register())
        ]);
  }
}
