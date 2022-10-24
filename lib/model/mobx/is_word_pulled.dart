import 'package:mobx/mobx.dart';
part 'is_word_pulled.g.dart';

// ignore: library_private_types_in_public_api
class IsWordPulledMobx = _IsWordPulledBase with _$IsWordPulledMobx;

abstract class _IsWordPulledBase with Store {
  @observable
  bool isWordPulled = false;

}
