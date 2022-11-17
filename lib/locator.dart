import 'package:get_it/get_it.dart';
import 'package:learn_english/components/home/viewmodel/home_viewmodel.dart';
import 'package:learn_english/components/learned_words/viewmodel/learned_words_viewmodel.dart';
import 'package:learn_english/components/user/forgot_password/viewmodel/forgot_password_viewmodel.dart';
import 'package:learn_english/components/user/login/viewmodel/login_viewmodel.dart';
import 'package:learn_english/components/user/user_informations/viewmodel/user_informations_viewmodel.dart';
import 'package:learn_english/components/user/register/viewmodel/register_viewmodel.dart';
import 'package:learn_english/store/is_logged_in_viewmodel.dart';

final locator = GetIt.instance;

// ignore: non_constant_identifier_names
void setup() {

  locator
      .registerLazySingleton<IsLoggedInViewModel>(() => IsLoggedInViewModel());
  locator.registerLazySingleton<RegisterViewModel>(() => RegisterViewModel());
  locator.registerLazySingleton<LearnedWordsViewModel>(
      () => LearnedWordsViewModel());
  locator.registerLazySingleton<UserInformationsViewModel>(
      () => UserInformationsViewModel());
  locator.registerLazySingleton<ForgotPasswordViewModel>(
      () => ForgotPasswordViewModel());
  locator.registerLazySingleton<LoginViewModel>(() => LoginViewModel());
  locator.registerLazySingleton<HomeViewModel>(
      () => HomeViewModel());
}
