// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_informations.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserInformationsMobx on _UserInformationsBase, Store {
  late final _$userInformationsAtom =
      Atom(name: '_UserInformationsBase.userInformations', context: context);

  @override
  Map<String, dynamic> get userInformations {
    _$userInformationsAtom.reportRead();
    return super.userInformations;
  }

  @override
  set userInformations(Map<String, dynamic> value) {
    _$userInformationsAtom.reportWrite(value, super.userInformations, () {
      super.userInformations = value;
    });
  }

  late final _$GetUserInformationsAsyncAction = AsyncAction(
      '_UserInformationsBase.GetUserInformations',
      context: context);

  @override
  Future<void> GetUserInformations() {
    return _$GetUserInformationsAsyncAction
        .run(() => super.GetUserInformations());
  }

  @override
  String toString() {
    return '''
userInformations: ${userInformations}
    ''';
  }
}
