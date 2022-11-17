// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$userDailyRightAtom =
      Atom(name: '_HomeViewModelBase.userDailyRight', context: context);

  @override
  int? get userDailyRight {
    _$userDailyRightAtom.reportRead();
    return super.userDailyRight;
  }

  @override
  set userDailyRight(int? value) {
    _$userDailyRightAtom.reportWrite(value, super.userDailyRight, () {
      super.userDailyRight = value;
    });
  }

  late final _$randomWordIndexRightNowAtom = Atom(
      name: '_HomeViewModelBase.randomWordIndexRightNow', context: context);

  @override
  int get randomWordIndexRightNow {
    _$randomWordIndexRightNowAtom.reportRead();
    return super.randomWordIndexRightNow;
  }

  @override
  set randomWordIndexRightNow(int value) {
    _$randomWordIndexRightNowAtom
        .reportWrite(value, super.randomWordIndexRightNow, () {
      super.randomWordIndexRightNow = value;
    });
  }

  late final _$isFinishWordPullingAtom =
      Atom(name: '_HomeViewModelBase.isFinishWordPulling', context: context);

  @override
  bool get isFinishWordPulling {
    _$isFinishWordPullingAtom.reportRead();
    return super.isFinishWordPulling;
  }

  @override
  set isFinishWordPulling(bool value) {
    _$isFinishWordPullingAtom.reportWrite(value, super.isFinishWordPulling, () {
      super.isFinishWordPulling = value;
    });
  }

  late final _$isButtonsActiveAtom =
      Atom(name: '_HomeViewModelBase.isButtonsActive', context: context);

  @override
  bool get isButtonsActive {
    _$isButtonsActiveAtom.reportRead();
    return super.isButtonsActive;
  }

  @override
  set isButtonsActive(bool value) {
    _$isButtonsActiveAtom.reportWrite(value, super.isButtonsActive, () {
      super.isButtonsActive = value;
    });
  }

  late final _$pullWordAsyncAction =
      AsyncAction('_HomeViewModelBase.pullWord', context: context);

  @override
  Future<List<WordModel>> pullWord() {
    return _$pullWordAsyncAction.run(() => super.pullWord());
  }

  late final _$pullLearnedWordsKeysAsyncAction =
      AsyncAction('_HomeViewModelBase.pullLearnedWordsKeys', context: context);

  @override
  Future<List<String>> pullLearnedWordsKeys() {
    return _$pullLearnedWordsKeysAsyncAction
        .run(() => super.pullLearnedWordsKeys());
  }

  late final _$userRightsControlAsyncAction =
      AsyncAction('_HomeViewModelBase.userRightsControl', context: context);

  @override
  Future<int> userRightsControl() {
    return _$userRightsControlAsyncAction.run(() => super.userRightsControl());
  }

  late final _$runUserRightsControlAsyncAction =
      AsyncAction('_HomeViewModelBase.runUserRightsControl', context: context);

  @override
  Future runUserRightsControl() {
    return _$runUserRightsControlAsyncAction
        .run(() => super.runUserRightsControl());
  }

  late final _$checkRemainingRightVersusPulledDailyRightAsyncAction =
      AsyncAction(
          '_HomeViewModelBase.checkRemainingRightVersusPulledDailyRight',
          context: context);

  @override
  Future checkRemainingRightVersusPulledDailyRight() {
    return _$checkRemainingRightVersusPulledDailyRightAsyncAction
        .run(() => super.checkRemainingRightVersusPulledDailyRight());
  }

  late final _$sendLearnedWordToDataBaseWithSetAsyncAction = AsyncAction(
      '_HomeViewModelBase.sendLearnedWordToDataBaseWithSet',
      context: context);

  @override
  Future sendLearnedWordToDataBaseWithSet(
      String userID, String word, String meaning) {
    return _$sendLearnedWordToDataBaseWithSetAsyncAction.run(
        () => super.sendLearnedWordToDataBaseWithSet(userID, word, meaning));
  }

  late final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase', context: context);

  @override
  dynamic setRandomWordIndexRightNow() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.setRandomWordIndexRightNow');
    try {
      return super.setRandomWordIndexRightNow();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userDailyRight: ${userDailyRight},
randomWordIndexRightNow: ${randomWordIndexRightNow},
isFinishWordPulling: ${isFinishWordPulling},
isButtonsActive: ${isButtonsActive}
    ''';
  }
}
