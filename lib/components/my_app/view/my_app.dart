import 'package:flutter/material.dart';
import 'package:learn_english/components/splash/view/splash_screen.dart';
import 'package:learn_english/components/user/forgot_password/view/forgot_password_screen.dart';
import 'package:learn_english/components/home/view/home_screen.dart';
import 'package:learn_english/components/learned_words/view/learned_words_list_screen.dart';
import 'package:learn_english/components/user/login/view/login_screen.dart';
import 'package:learn_english/components/user/register/view/register_screen.dart';
import 'package:learn_english/components/user/user_informations/view/user_informations_screen.dart';
import 'package:get/get_navigation/get_navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "LEWAS",
        home: const SplassScreen(),
        theme: ThemeData.light(),
        getPages: [
          GetPage(name: "/home-page", page: () => const HomeScreen()),
          GetPage(name: "/login-page", page: () => const LoginScreen()),
          GetPage(name: "/forgot-password", page: () => ForgotPasswordScreen()),
          GetPage(name: "/register", page: () => const RegisterScreen()),
          GetPage(
            name: "/learned-page",
            page: () => const LearnedWordsListScreen(),
          ),
          GetPage(
              name: "/user-informations-page",
              page: () => const UserInformations())
        ]);
  }
}
