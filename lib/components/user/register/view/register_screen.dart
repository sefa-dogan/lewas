import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_english/components/user/register/viewmodel/register_viewmodel.dart';
import 'package:learn_english/locator.dart';
import 'package:learn_english/components/user/register/view/widgets/register_form.dart';
import 'package:learn_english/utils/atomic_widgets/elevated_button.dart';
import 'package:learn_english/utils/constants/app_constants.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final viewModel = locator<RegisterViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            AppConstants.appTitle,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size(10, 10),
          child: Text(
            AppConstants.subTitle,
            style: TextStyle(
              color: Colors.purple,
              fontSize: 18,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const RegisterForm(),
          GenericElevatedButton(
              childWidget: const Text("Register"),
              onPressedFunc: () async {
                viewModel.registerWithEmailPassword(context);
                Get.offAllNamed("login-page");
              }),
        ],
      ),
    );
  }
}
