import 'package:get_it/get_it.dart';
import 'package:learn_english/model/mobx/is_logged_in.dart';
import 'package:learn_english/model/mobx/profile_image.dart';
import 'package:learn_english/model/mobx/register_info.dart';
import 'package:learn_english/model/mobx/user_informations.dart';
import 'package:learn_english/screens/register_screen.dart';

final locator = GetIt.instance;

// ignore: non_constant_identifier_names
void Setup() {
  locator.registerSingleton<IsLoggedInMobx>(IsLoggedInMobx());
  locator.registerSingleton<ProfileImage>(ProfileImage());
  locator.registerSingleton<Register>(const Register());
  locator.registerSingleton<RegisterInfo>(RegisterInfo());
  locator.registerSingleton<UserInformationsMobx>(UserInformationsMobx());
}
