// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_word_pulled.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IsWordPulledMobx on _IsWordPulledBase, Store {
  late final _$isWordPulledAtom =
      Atom(name: '_IsWordPulledBase.isWordPulled', context: context);

  @override
  bool get isWordPulled {
    _$isWordPulledAtom.reportRead();
    return super.isWordPulled;
  }

  @override
  set isWordPulled(bool value) {
    _$isWordPulledAtom.reportWrite(value, super.isWordPulled, () {
      super.isWordPulled = value;
    });
  }

  @override
  String toString() {
    return '''
isWordPulled: ${isWordPulled}
    ''';
  }
}
