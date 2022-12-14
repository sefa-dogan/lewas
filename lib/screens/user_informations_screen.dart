import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_english/locator.dart';
import 'package:learn_english/model/mobx/is_logged_in.dart';
import 'package:learn_english/model/mobx/profile_image.dart';
import 'package:learn_english/model/mobx/user_informations.dart';
import 'package:learn_english/widgets/menuBari.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInformations extends StatefulWidget {
  const UserInformations({super.key});

  @override
  State<UserInformations> createState() => _UserInformationsState();
}

class _UserInformationsState extends State<UserInformations> {
  final _locator = locator<IsLoggedInMobx>();
  final _locatorPImage = locator<ProfileImage>();
  final _locatorUserInfo = locator<UserInformationsMobx>();

  late String _isim;
  late String _soyisim;
  late String _email;
  bool activity = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final SharedPreferences _prefs;
  final ImagePicker _picker = ImagePicker();
  // ignore: prefer_typing_uninitialized_variables
  var _user;
  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    _isim = _locatorUserInfo.userInformations["isim"];
    _soyisim = _locatorUserInfo.userInformations["soyisim"];
    _email = _locatorUserInfo.userInformations["e-mail"];
  }

  @override
  Widget build(BuildContext userInfocontext) {
    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
          // ignore: sort_child_properties_last
          child: Text(
            "Learn English Words And Speak",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          preferredSize: Size(10, 10),
        ),
        title: const Center(
            child: Text(
          "LEWAS",
          style: TextStyle(color: Colors.purple, fontSize: 24),
        )),
        automaticallyImplyLeading:
            false, // yeni bir sayfa a????ld?????? zaman geriye d??nmek i??in appbara yerle??tirilen butonun yerle??tirilmesini ??nler.
        actions: [
          IconButton(
              onPressed: () {
                activity = true;
                setState(() {});
              },
              icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: () async {
                await _auth.signOut();
                _prefs = await SharedPreferences.getInstance();
                _prefs.setString("mailAdress", "");
                _prefs.setString("sifre", "");
                // ignore: no_leading_underscores_for_local_identifiers
                _locator.screen = false;
                Get.offAllNamed("loginpage");
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
                  return CircleAvatar(backgroundImage: _locatorPImage.pic);
                }),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  color: Colors.grey,
                  onPressed: () async {
                    XFile? file =
                        await _picker.pickImage(source: ImageSource.gallery);
                    if (file != null) {
                      await _locatorPImage.UploadPicture(file.path);
                      await _locatorPImage.GetUserProfilePicture();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              title: Text(
                                  "Profil foto??raf??n??z ba??ar??yla y??klendi"),
                            );
                          });
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text("Profil foto??raf??n??z y??klenmedi"),
                          );
                        },
                      );
                    }
                  },
                  icon: const Icon(Icons.edit),
                ),
              ),
            ]),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Expanded(
                child: Column(
                  children: [
                    TextFieldColumnForUsers(activity),
                    ElevatedButton(
                        onPressed: () async {
                          await _firestore
                              .doc("students/${_user.uid}")
                              .collection("Student Info")
                              .doc("Student Info")
                              .set({
                            "isim": _isim,
                            "soyisim": _soyisim,
                            "e-mail": _email,
                          }, SetOptions(merge: true));
                          activity = false;
                          await _auth.currentUser!.updateEmail(_email);
                          await _locatorUserInfo.GetUserInformations();
                          setState(() {});
                        },
                        child: const Text("Update")),
                  ],
                ),
              ),
            ),
          ),
          MenuBari().createBar(userInfocontext)
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  SingleChildScrollView TextFieldColumnForUsers(bool activityTextField) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 40, bottom: 15, top: 10),
          child: TextField(
            controller:
                TextEditingController.fromValue(TextEditingValue(text: _isim)),
            decoration: InputDecoration(
              enabled: activityTextField,
              hintText: "Name",
              labelText: "Name",
              border: const OutlineInputBorder(),
            ),
            onChanged: (value) => _isim = value,
            autofocus: true,
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 40, bottom: 15, top: 10),
          child: TextField(
            controller: TextEditingController.fromValue(
                TextEditingValue(text: _soyisim)),
            decoration: InputDecoration(
              enabled: activityTextField,
              hintText: "Surname",
              labelText: "Surname",
              border: const OutlineInputBorder(),
            ),
            onChanged: (value) => _soyisim = value,
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 40, bottom: 15, top: 10),
          child: TextField(
            controller:
                TextEditingController.fromValue(TextEditingValue(text: _email)),
            decoration: InputDecoration(
              enabled: activityTextField,
              hintText: "E-mail",
              labelText: "E-mail",
              border: const OutlineInputBorder(),
            ),
            onChanged: (value) => _email = value,
          ),
        ),
      ],
    ));
  }
}
