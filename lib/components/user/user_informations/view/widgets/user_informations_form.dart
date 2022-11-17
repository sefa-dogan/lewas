import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:learn_english/components/user/user_informations/viewmodel/user_informations_viewmodel.dart';
import 'package:learn_english/locator.dart';
import 'package:learn_english/utils/atomic_widgets/textfield.dart';

class UserInformationsForm extends StatelessWidget {
  UserInformationsForm({super.key});

  final viewModel = locator<UserInformationsViewModel>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Observer(builder: (_) {
          return GenericTextField(
              autoFocus: true,
              text: "Name",
              textEditingController: viewModel.controllerName,
              onChangedValue: viewModel.setName,
              isActive: viewModel.activity,
              left: 10,
              right: 40,
              bottom: 15,
              top: 10);
        }),
        Observer(builder: (_) {
          return GenericTextField(
              text: "Surname",
              onChangedValue: viewModel.setSurname,
              textEditingController: viewModel.controllerSurname,
              isActive: viewModel.activity,
              left: 10,
              right: 40,
              top: 10,
              bottom: 15);
        }),
        Observer(builder: (_) {
          return GenericTextField(
              text: "E-mail",
              textEditingController: viewModel.controllerEmail,
              onChangedValue: viewModel.setEmail,
              isActive: viewModel.activity,
              left: 10,
              right: 40,
              top: 10,
              bottom: 15);
        }),
      ],
    ));
  }
}
