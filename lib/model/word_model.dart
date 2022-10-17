// To parse this JSON data, do
//
//     final wordModel = wordModelFromMap(jsonString);

import 'dart:convert';

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

class Meaning {
  Meaning({
    required this.partOfSpeech,
    required this.definitions,
  });

  final String partOfSpeech;
  final List<Definition> definitions;

  factory Meaning.fromMap(Map<String, dynamic> json) => Meaning(
        partOfSpeech: json["partOfSpeech"],
        definitions: List<Definition>.from(
            json["definitions"].map((x) => Definition.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "partOfSpeech": partOfSpeech,
        "definitions": List<dynamic>.from(definitions.map((x) => x.toMap())),
      };
}

class Definition {
  Definition({
    required this.definition,
  });

  final String definition;

  factory Definition.fromMap(Map<String, dynamic> json) => Definition(
        definition: json["definition"],
      );

  Map<String, dynamic> toMap() => {
        "definition": definition,
      };
}
