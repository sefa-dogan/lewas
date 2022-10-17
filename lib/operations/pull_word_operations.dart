
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/model/word_model.dart';
import 'package:learn_english/operations/learned_words_operations.dart';

class PullWord {
  List<String> wordList = [
    "pencil",
    "headphone",
    "ring",
    "bag",
    "door",
    "dress",
    "laptop",
    "air",
    "cable",
    "bin",
    "shoe",
    "muscle",
    "wall",
    "shelf"
  ]; //"table" kelimesinde sorun çıkıyor
  final String _path;
  PullWord(this._path);

  late List<String> learnedWordKey;

  Future<List<WordModel>> pullWord() async {
    // ignore: no_leading_underscores_for_local_identifiers
    List<WordModel> _wordAndMeanList = [];
    try {
      learnedWordKey = await LearnedWordsOperations().pullLearnedWordsKeys();
      learnedWordKey.removeWhere((word) => wordList.remove(word));
      for (int i = 0; i < wordList.length; i++) {
        // ignore: no_leading_underscores_for_local_identifiers
        var _response = await Dio().get(_path + wordList[i]);
        // ignore: no_leading_underscores_for_local_identifiers
        var _cekilenBilgi = _response.data;
        // debugPrint(_cekilenBilgi.toString());
        List<WordModel> suankiKelime =
            ((_cekilenBilgi as List).map((e) => WordModel.fromMap(e)).toList());
        _wordAndMeanList.add(suankiKelime[0]);
        // debugPrint(suankiKelime[0].toMap().toString());
      }
      return _wordAndMeanList;
    } catch (e) {
      debugPrint(e.toString());
      return Future.error(e);
    }
  }
}
