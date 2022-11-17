// To parse this JSON data, do
//
//     final wordModel = wordModelFromMap(jsonString);

import 'dart:convert';

import 'package:learn_english/components/home/model/meaning.dart';

WordModel wordModelFromMap(String str) => WordModel.fromMap(json.decode(str));

String wordModelToMap(WordModel data) => json.encode(data.toMap());

class WordModel {
  WordModel({
    required this.word,
    required this.phonetic,
    required this.meanings,
  });

  final String word;
  final String phonetic;
  final List<Meaning> meanings;

  factory WordModel.fromMap(Map<String, dynamic> json) => WordModel(
        word: json["word"],
        phonetic: json["phonetic"],
        meanings:
            List<Meaning>.from(json["meanings"].map((x) => Meaning.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "word": word,
        "phonetic": phonetic,
        "meanings": List<dynamic>.from(meanings.map((x) => x.toMap())),
      };
}
