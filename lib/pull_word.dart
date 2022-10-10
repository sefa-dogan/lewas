import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/model/word_model.dart';

class PullWord {
  List<String> wordList = [
    "pencil",
    "headphone",
    "ring"
  ]; //"table" kelimesinde sorun çıkıyor
  String _path;
  PullWord(this._path);

  Future<List<WordModel>> pullWord() async {
    List<WordModel> _wordAndMeanList = [];
    try {
      // wordList.shuffle();
      for (int i = 0; i < wordList.length; i++) {
        var _response = await Dio().get(_path + wordList[i]);
        var _cekilenBilgi = _response.data;
        List<WordModel> suankiKelime =
            (_cekilenBilgi as List).map((e) => WordModel.fromMap(e)).toList();
        _wordAndMeanList.add(suankiKelime[0]);
      }
      return _wordAndMeanList;
    } catch (e) {
      debugPrint(e.toString());
      return Future.error(e);
    }
  }
}
