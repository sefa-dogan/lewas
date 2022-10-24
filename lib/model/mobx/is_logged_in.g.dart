// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_logged_in.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IsLoggedInMobx on _IsLoggedInBase, Store {
  late final _$emailAtom =
      Atom(name: '_IsLoggedInBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$sifreAtom =
      Atom(name: '_IsLoggedInBase.sifre', context: context);

  @override
  String? get sifre {
    _$sifreAtom.reportRead();
    return super.sifre;
  }

  @override
  set sifre(String? value) {
    _$sifreAtom.reportWrite(value, super.sifre, () {
      super.sifre = value;
    });
  }

  late final _$screenAtom =
      Atom(name: '_IsLoggedInBase.screen', context: context);

  @override
  bool get screen {
    _$screenAtom.reportRead();
    return super.screen;
  }

  @override
  set screen(bool value) {
    _$screenAtom.reportWrite(value, super.screen, () {
      super.screen = value;
    });
  }

  late final _$setAndSaveEmailAndSifreAsyncAction =
      AsyncAction('_IsLoggedInBase.setAndSaveEmailAndSifre', context: context);

  @override
  Future<void> setAndSaveEmailAndSifre(String _email, String _sifre) {
    return _$setAndSaveEmailAndSifreAsyncAction
        .run(() => super.setAndSaveEmailAndSifre(_email, _sifre));
  }

  late final _$isLoggedInOrNotAsyncAction =
      AsyncAction('_IsLoggedInBase.isLoggedInOrNot', context: context);

  @override
  Future<void> isLoggedInOrNot() {
    return _$isLoggedInOrNotAsyncAction.run(() => super.isLoggedInOrNot());
  }

  @override
  String toString() {
    return '''
email: ${email},
sifre: ${sifre},
screen: ${screen}
    ''';
  }
}
