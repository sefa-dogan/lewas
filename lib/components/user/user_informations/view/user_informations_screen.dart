// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:learn_english/components/user/user_informations/view/widgets/user_informations_form.dart';
import 'package:learn_english/components/user/user_informations/viewmodel/user_informations_viewmodel.dart';
import 'package:learn_english/locator.dart';
import 'package:learn_english/utils/atomic_widgets/bottom_menu_bar.dart';
import 'package:learn_english/utils/atomic_widgets/elevated_button.dart';
import 'package:learn_english/utils/constants/app_constants.dart';

class UserInformations extends StatefulWidget {
  const UserInformations({super.key});

  @override
  State<UserInformations> createState() => _UserInformationsState();
}

class _UserInformationsState extends State<UserInformations> {
  final viewModel = locator<UserInformationsViewModel>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext userInfocontext) {
    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
          // ignore: sort_child_properties_last
          child: Text(
            AppConstants.subTitle,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          preferredSize: Size(10, 10),
        ),
        title: const Center(
            child: Text(
          AppConstants.appTitle,
          style: TextStyle(color: Colors.purple, fontSize: 24),
        )),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                viewModel.activity = true;
              },
              icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: () async {
                await viewModel.signOut();
                Get.offAllNamed("login-page");
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Stack(children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Observer(builder: (_) {
                  return CircleAvatar(backgroundImage: viewModel.pic);
                }),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  color: Colors.grey,
                  onPressed: () async {
                    await viewModel.uploadProfilePicture(context);
                  },
                  icon: const Icon(Icons.edit),
                ),
              ),
            ]),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  UserInformationsForm(),
                  GenericElevatedButton(
                      childWidget: const Text("Update"),
                      onPressedFunc: () async {
                        await viewModel.updateUserInformations();
                      }),
                  // ElevatedButton(
                  //     onPressed: () async {
                  //       await viewModel.updateUserInformations();
                  //     },
                  //     child: const Text("Update")),
                ],
              ),
            ),
          ),
          BottomMenuBar()
        ],
      ),
    );
  }
}
