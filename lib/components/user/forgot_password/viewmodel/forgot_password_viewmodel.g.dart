// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ForgotPasswordViewModel on _ForgotPasswordViewModelBase, Store {
  late final _$emailAtom =
      Atom(name: '_ForgotPasswordViewModelBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$forgotPasswordAsyncAction = AsyncAction(
      '_ForgotPasswordViewModelBase.forgotPassword',
      context: context);

  @override
  Future forgotPassword(BuildContext context) {
    return _$forgotPasswordAsyncAction.run(() => super.forgotPassword(context));
  }

  @override
  String toString() {
    return '''
email: ${email}
    ''';
  }
}
