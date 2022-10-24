import 'package:mobx/mobx.dart';
part 'register_info.g.dart';

// ignore: library_private_types_in_public_api
class RegisterInfo = _RegisterInfoBase with _$RegisterInfo;

abstract class _RegisterInfoBase with Store {
  @observable
   String name="";
  @observable
   String surname="";
  @observable
   String email="";
  @observable
   String password="";
}
