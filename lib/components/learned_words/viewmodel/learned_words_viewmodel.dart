// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:learn_english/components/learned_words/model/learned_word.dart';
import 'package:learn_english/components/learned_words/model/word_model.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'learned_words_viewmodel.g.dart';

class LearnedWordsViewModel = _LearnedWordsViewModelBase
    with _$LearnedWordsViewModel;

abstract class _LearnedWordsViewModelBase with Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _apiLink = "https://api.dictionaryapi.dev/api/v2/entries/en/";

  @observable
  String userID = "";

  @observable
  List<WordModel> learnedWords = [];

  @observable
  List<String> learnedWordKey = [];

  @observable
  bool isLearnedWordsAndMeansPulled = false;

  @observable
  List<LearnedWord> learnedWordsAndMeaningsModel = <LearnedWord>[];

  @observable
  bool isDeleting = false;

  @action
  getLearnedWordsAndMeans() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<LearnedWord> tmp = [];
    isLearnedWordsAndMeansPulled = false;
    learnedWordsAndMeaningsModel = [];
    final learnedWordsAndMeansMap = (await _firestore
            .doc("students/$userID/learnedwords/learnedwords")
            .get())
        .data()!;
    for (var element in learnedWordsAndMeansMap.keys) {
      var response = await Dio().get(_apiLink + element);
      List<LearnedWord> learnedWord =
          ((response.data) as List).map((e) => LearnedWord.fromMap(e)).toList();

      tmp.add(learnedWord[0]);
    }
    learnedWordsAndMeaningsModel = tmp;
    pref.setString(
        "learnedwordsnumber", learnedWordsAndMeaningsModel.length.toString());

    isLearnedWordsAndMeansPulled = true;
  }

  @action
  pullLearnedWordsKeys() async {
    return (await _firestore
            .doc("students/$userID/learnedwords/learnedwords")
            .get())
        .data()!
        .keys
        .toList();
  }

  deleting(bool value) {

  }

  @action
  // ignore: non_constant_identifier_names
  deleteLearnedWord(LearnedWord willDeleteWord) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await _firestore
        .doc("students/$userID/learnedwords/learnedwords")
        .update({willDeleteWord.word: FieldValue.delete()});
    isDeleting = false;
    learnedWordsAndMeaningsModel.remove(willDeleteWord);
    pref.setString(
        "learnedwordsnumber", learnedWordsAndMeaningsModel.length.toString());
  }
}
