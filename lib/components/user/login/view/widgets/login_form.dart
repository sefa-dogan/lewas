import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_english/components/user/login/view/widgets/local_textbutton.dart';
import 'package:learn_english/components/user/login/viewmodel/login_viewmodel.dart';
import 'package:learn_english/locator.dart';
import 'package:learn_english/utils/atomic_widgets/textfield.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final viewModel = locator<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GenericTextField(
            text: "E-mail",
            onChangedValue: viewModel.setEmail,
            left: 40,
            right: 40,
            top: 10,
            bottom: 10),
        GenericTextField(
            text: "Password",
            onChangedValue: viewModel.setPassword,
            left: 40,
            right: 40,
            top: 10,
            bottom: 10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          LocalTextButton(
            childWidget: const Text("Forgot password"),
            onPressedFunc: () async {
              await Get.toNamed("forgot-password");
            },
            left: 40,
          ),
          LocalTextButton(
            childWidget: const Text(
              "Register",
              style: TextStyle(color: Colors.blue),
              textAlign: TextAlign.right,
            ),
            onPressedFunc: () async {
              await Get.toNamed("register");
            },
            right: 40,
          ),
        ]),
        ElevatedButton.icon(
            onPressed: () async {
              viewModel.signInWithEmailPassword(context);
            },
            icon: const Icon(Icons.key),
            label: const Text("Login")),
      ],
    );
  }
}
