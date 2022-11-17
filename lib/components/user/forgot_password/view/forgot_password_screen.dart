import 'package:flutter/material.dart';
import 'package:learn_english/components/user/forgot_password/viewmodel/forgot_password_viewmodel.dart';
import 'package:learn_english/locator.dart';
import 'package:learn_english/utils/atomic_widgets/elevated_button.dart';
import 'package:learn_english/utils/atomic_widgets/textfield.dart';
import 'package:learn_english/utils/constants/app_constants.dart';

// ignore: must_be_immutable
class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final viewModel = locator<ForgotPasswordViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            AppConstants.appTitle,
            style: TextStyle(fontSize: 24),
          ),
        ),
        bottom: const PreferredSize(
          // ignore: sort_child_properties_last
          child: Text(
            AppConstants.subTitle,
            style: TextStyle(color: Colors.purple, fontSize: 16),
          ),
          preferredSize: Size(10, 10),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GenericTextField(
              text: "Enter your e-mail address",
              onChangedValue: viewModel.setEmail,
              left: 40,
              right: 40,
              bottom: 10),
          // ForgotPasswordScreenTextfield(),
          Expanded(
            child: Container(
                alignment: Alignment.topCenter,
                child: GenericElevatedButton(
                  onPressedFunc: () async {
                    await viewModel.forgotPassword(context);
                  },
                  childWidget: const Text("Send Reset E-mail"),
                )),
          ),
          // ForgotPasswordScreenElevatedButton()
        ],
      ),
    );
  }
}
