// ignore_for_file: unused_field, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:learn_english/components/user/login/view/widgets/login_form.dart';
import 'package:learn_english/utils/constants/app_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size(10, 10),
          child: Text(
            AppConstants.subTitle,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        title: const Center(
            child: Text(
          AppConstants.appTitle,
          style: TextStyle(color: Colors.purple, fontSize: 24),
        )),
        automaticallyImplyLeading: false,
      ),
      body: LoginForm(),
    );
  }
}
