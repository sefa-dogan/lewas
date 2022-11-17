// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:learn_english/locator.dart';
import 'package:learn_english/components/user/register/viewmodel/register_viewmodel.dart';
import 'package:learn_english/utils/atomic_widgets/textfield.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final viewModel = locator<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
          child: Column(
        children: [
          GenericTextField(
              text: "Name",
              onChangedValue: viewModel.setName,
              left: 10,
              right: 40,
              top: 10,
              bottom: 15),
          GenericTextField(
              text: "Surname",
              onChangedValue: viewModel.setSurname,
              left: 10,
              right: 40,
              top: 10,
              bottom: 15),
          GenericTextField(
              text: "E-mail",
              onChangedValue: viewModel.setEmail,
              left: 10,
              right: 40,
              top: 10,
              bottom: 15),
          GenericTextField(
              text: "Password",
              onChangedValue: viewModel.setPassword,
              left: 10,
              right: 40,
              top: 10,
              bottom: 15)
        ],
      )),
    );
  }
}
