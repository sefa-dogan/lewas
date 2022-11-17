// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learned_words_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LearnedWordsViewModel on _LearnedWordsViewModelBase, Store {
  late final _$userIDAtom =
      Atom(name: '_LearnedWordsViewModelBase.userID', context: context);

  @override
  String get userID {
    _$userIDAtom.reportRead();
    return super.userID;
  }

  @override
  set userID(String value) {
    _$userIDAtom.reportWrite(value, super.userID, () {
      super.userID = value;
    });
  }

  late final _$learnedWordsAtom =
      Atom(name: '_LearnedWordsViewModelBase.learnedWords', context: context);

  @override
  List<WordModel> get learnedWords {
    _$learnedWordsAtom.reportRead();
    return super.learnedWords;
  }

  @override
  set learnedWords(List<WordModel> value) {
    _$learnedWordsAtom.reportWrite(value, super.learnedWords, () {
      super.learnedWords = value;
    });
  }

  late final _$learnedWordKeyAtom =
      Atom(name: '_LearnedWordsViewModelBase.learnedWordKey', context: context);

  @override
  List<String> get learnedWordKey {
    _$learnedWordKeyAtom.reportRead();
    return super.learnedWordKey;
  }

  @override
  set learnedWordKey(List<String> value) {
    _$learnedWordKeyAtom.reportWrite(value, super.learnedWordKey, () {
      super.learnedWordKey = value;
    });
  }

  late final _$isLearnedWordsAndMeansPulledAtom = Atom(
      name: '_LearnedWordsViewModelBase.isLearnedWordsAndMeansPulled',
      context: context);

  @override
  bool get isLearnedWordsAndMeansPulled {
    _$isLearnedWordsAndMeansPulledAtom.reportRead();
    return super.isLearnedWordsAndMeansPulled;
  }

  @override
  set isLearnedWordsAndMeansPulled(bool value) {
    _$isLearnedWordsAndMeansPulledAtom
        .reportWrite(value, super.isLearnedWordsAndMeansPulled, () {
      super.isLearnedWordsAndMeansPulled = value;
    });
  }

  late final _$learnedWordsAndMeaningsModelAtom = Atom(
      name: '_LearnedWordsViewModelBase.learnedWordsAndMeaningsModel',
      context: context);

  @override
  List<LearnedWord> get learnedWordsAndMeaningsModel {
    _$learnedWordsAndMeaningsModelAtom.reportRead();
    return super.learnedWordsAndMeaningsModel;
  }

  @override
  set learnedWordsAndMeaningsModel(List<LearnedWord> value) {
    _$learnedWordsAndMeaningsModelAtom
        .reportWrite(value, super.learnedWordsAndMeaningsModel, () {
      super.learnedWordsAndMeaningsModel = value;
    });
  }

  late final _$isDeletingAtom =
      Atom(name: '_LearnedWordsViewModelBase.isDeleting', context: context);

  @override
  bool get isDeleting {
    _$isDeletingAtom.reportRead();
    return super.isDeleting;
  }

  @override
  set isDeleting(bool value) {
    _$isDeletingAtom.reportWrite(value, super.isDeleting, () {
      super.isDeleting = value;
    });
  }

  late final _$getLearnedWordsAndMeansAsyncAction = AsyncAction(
      '_LearnedWordsViewModelBase.getLearnedWordsAndMeans',
      context: context);

  @override
  Future getLearnedWordsAndMeans() {
    return _$getLearnedWordsAndMeansAsyncAction
        .run(() => super.getLearnedWordsAndMeans());
  }

  late final _$pullLearnedWordsKeysAsyncAction = AsyncAction(
      '_LearnedWordsViewModelBase.pullLearnedWordsKeys',
      context: context);

  @override
  Future pullLearnedWordsKeys() {
    return _$pullLearnedWordsKeysAsyncAction
        .run(() => super.pullLearnedWordsKeys());
  }

  late final _$deleteLearnedWordAsyncAction = AsyncAction(
      '_LearnedWordsViewModelBase.deleteLearnedWord',
      context: context);

  @override
  Future deleteLearnedWord(LearnedWord willDeleteWord) {
    return _$deleteLearnedWordAsyncAction
        .run(() => super.deleteLearnedWord(willDeleteWord));
  }

  @override
  String toString() {
    return '''
userID: ${userID},
learnedWords: ${learnedWords},
learnedWordKey: ${learnedWordKey},
isLearnedWordsAndMeansPulled: ${isLearnedWordsAndMeansPulled},
learnedWordsAndMeaningsModel: ${learnedWordsAndMeaningsModel},
isDeleting: ${isDeleting}
    ''';
  }
}
