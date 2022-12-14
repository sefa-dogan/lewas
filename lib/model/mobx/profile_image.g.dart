// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_image.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileImage on _ProfileImageBase, Store {
  late final _$_fileAtom =
      Atom(name: '_ProfileImageBase._file', context: context);

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

  late final _$picAtom = Atom(name: '_ProfileImageBase.pic', context: context);

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

  late final _$UploadPictureAsyncAction =
      AsyncAction('_ProfileImageBase.UploadPicture', context: context);

  @override
  Future<void> UploadPicture(String path) {
    return _$UploadPictureAsyncAction.run(() => super.UploadPicture(path));
  }

  late final _$GetUserProfilePictureAsyncAction =
      AsyncAction('_ProfileImageBase.GetUserProfilePicture', context: context);

  @override
  Future<void> GetUserProfilePicture() {
    return _$GetUserProfilePictureAsyncAction
        .run(() => super.GetUserProfilePicture());
  }

  @override
  String toString() {
    return '''
pic: ${pic}
    ''';
  }
}
