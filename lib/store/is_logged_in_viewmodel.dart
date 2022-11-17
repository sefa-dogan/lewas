// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:learn_english/components/learned_words/viewmodel/learned_words_viewmodel.dart';
import 'package:learn_english/components/user/user_informations/viewmodel/user_informations_viewmodel.dart';
import 'package:learn_english/locator.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'is_logged_in_viewmodel.g.dart';

class IsLoggedInViewModel = _IsLoggedInViewModelBase with _$IsLoggedInViewModel;
final _locatorUserInfo = locator<UserInformationsViewModel>();

abstract class _IsLoggedInViewModelBase with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _locatorLearnedWordsViewModel = locator<LearnedWordsViewModel>();
  var _prefs;

  @observable
  String? email;
  @observable
  String? sifre;
  @observable
  bool screen = false;

  @action
  isLoggedInOrNot() async {
    _prefs = await SharedPreferences.getInstance();
    email = _prefs.getString("mailAdress") ?? "";
    sifre = _prefs.getString("sifre") ?? "";

    if (email != "" && email != null && sifre != "" && sifre != null) {
      await _auth.signInWithEmailAndPassword(email: email!, password: sifre!);
      await _locatorUserInfo.getUserProfilePicture();
      await _locatorUserInfo.getUserInformations();
      _locatorLearnedWordsViewModel.userID = _auth.currentUser!.uid;

      // await _locatorLearnedWordsViewModel.getLearnedWordsAndMeans();
      // await _locatorIsWordPulledViewModel.pullLearnedWordsAndMeans();
      screen = true; //HomePage e yönlendirir
    } else {
      screen = false; //LoginScreen e yönlendirir
    }
  }
}
