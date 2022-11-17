// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_informations_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserInformationsViewModel on _UserInformationsViewModelBase, Store {
  late final _$activityAtom =
      Atom(name: '_UserInformationsViewModelBase.activity', context: context);

  @override
  bool get activity {
    _$activityAtom.reportRead();
    return super.activity;
  }

  @override
  set activity(bool value) {
    _$activityAtom.reportWrite(value, super.activity, () {
      super.activity = value;
    });
  }

  late final _$userInformationsAtom = Atom(
      name: '_UserInformationsViewModelBase.userInformations',
      context: context);

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

  late final _$nameAtom =
      Atom(name: '_UserInformationsViewModelBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$surnameAtom =
      Atom(name: '_UserInformationsViewModelBase.surname', context: context);

  @override
  String get surname {
    _$surnameAtom.reportRead();
    return super.surname;
  }

  @override
  set surname(String value) {
    _$surnameAtom.reportWrite(value, super.surname, () {
      super.surname = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_UserInformationsViewModelBase.email', context: context);

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

  late final _$controllerNameAtom = Atom(
      name: '_UserInformationsViewModelBase.controllerName', context: context);

  @override
  TextEditingController get controllerName {
    _$controllerNameAtom.reportRead();
    return super.controllerName;
  }

  @override
  set controllerName(TextEditingController value) {
    _$controllerNameAtom.reportWrite(value, super.controllerName, () {
      super.controllerName = value;
    });
  }

  late final _$controllerSurnameAtom = Atom(
      name: '_UserInformationsViewModelBase.controllerSurname',
      context: context);

  @override
  TextEditingController get controllerSurname {
    _$controllerSurnameAtom.reportRead();
    return super.controllerSurname;
  }

  @override
  set controllerSurname(TextEditingController value) {
    _$controllerSurnameAtom.reportWrite(value, super.controllerSurname, () {
      super.controllerSurname = value;
    });
  }

  late final _$controllerEmailAtom = Atom(
      name: '_UserInformationsViewModelBase.controllerEmail', context: context);

  @override
  TextEditingController get controllerEmail {
    _$controllerEmailAtom.reportRead();
    return super.controllerEmail;
  }

  @override
  set controllerEmail(TextEditingController value) {
    _$controllerEmailAtom.reportWrite(value, super.controllerEmail, () {
      super.controllerEmail = value;
    });
  }

  late final _$_fileAtom =
      Atom(name: '_UserInformationsViewModelBase._file', context: context);

  @override
  XFile? get _file {
    _$_fileAtom.reportRead();
    return super._file;
  }

  @override
  set _file(XFile? value) {
    _$_fileAtom.reportWrite(value, super._file, () {
      super._file = value;
    });
  }

  late final _$picAtom =
      Atom(name: '_UserInformationsViewModelBase.pic', context: context);

  @override
  ImageProvider<Object>? get pic {
    _$picAtom.reportRead();
    return super.pic;
  }

  @override
  set pic(ImageProvider<Object>? value) {
    _$picAtom.reportWrite(value, super.pic, () {
      super.pic = value;
    });
  }

  late final _$getUserInformationsAsyncAction = AsyncAction(
      '_UserInformationsViewModelBase.getUserInformations',
      context: context);

  @override
  Future getUserInformations() {
    return _$getUserInformationsAsyncAction
        .run(() => super.getUserInformations());
  }

  late final _$updateUserInformationsAsyncAction = AsyncAction(
      '_UserInformationsViewModelBase.updateUserInformations',
      context: context);

  @override
  Future updateUserInformations() {
    return _$updateUserInformationsAsyncAction
        .run(() => super.updateUserInformations());
  }

  late final _$uploadPictureToFirebaseStorageAsyncAction = AsyncAction(
      '_UserInformationsViewModelBase.uploadPictureToFirebaseStorage',
      context: context);

  @override
  Future uploadPictureToFirebaseStorage(String path) {
    return _$uploadPictureToFirebaseStorageAsyncAction
        .run(() => super.uploadPictureToFirebaseStorage(path));
  }

  late final _$getUserProfilePictureAsyncAction = AsyncAction(
      '_UserInformationsViewModelBase.getUserProfilePicture',
      context: context);

  @override
  Future getUserProfilePicture() {
    return _$getUserProfilePictureAsyncAction
        .run(() => super.getUserProfilePicture());
  }

  late final _$uploadProfilePictureAsyncAction = AsyncAction(
      '_UserInformationsViewModelBase.uploadProfilePicture',
      context: context);

  @override
  Future uploadProfilePicture(BuildContext context) {
    return _$uploadProfilePictureAsyncAction
        .run(() => super.uploadProfilePicture(context));
  }

  late final _$signOutAsyncAction =
      AsyncAction('_UserInformationsViewModelBase.signOut', context: context);

  @override
  Future signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  @override
  String toString() {
    return '''
activity: ${activity},
userInformations: ${userInformations},
name: ${name},
surname: ${surname},
email: ${email},
controllerName: ${controllerName},
controllerSurname: ${controllerSurname},
controllerEmail: ${controllerEmail},
pic: ${pic}
    ''';
  }
}
