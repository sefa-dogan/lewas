// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:learn_english/components/learned_words/model/meaning.dart';

class LearnedWord {
  final String word;
  final List<Meaning> meanings;
  LearnedWord({
    required this.word,
    required this.meanings,
  });

  LearnedWord copyWith({
    String? word,
    List<Meaning>? meanings,
  }) {
    return LearnedWord(
      word: word ?? this.word,
      meanings: meanings ?? this.meanings,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'word': word,
      'meanings': meanings.map((x) => x.toMap()).toList(),
    };
  }

  factory LearnedWord.fromMap(Map<String, dynamic> map) {
    return LearnedWord(
      word: map['word'] as String,
      meanings: List<Meaning>.from(
        (map['meanings'] as List<dynamic>).map<Meaning>(
          (x) => Meaning.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory LearnedWord.fromJson(String source) =>
      LearnedWord.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LearnedWord(word: $word, meanings: $meanings)';

  @override
  bool operator ==(covariant LearnedWord other) {
    if (identical(this, other)) return true;

    return other.word == word && listEquals(other.meanings, meanings);
  }

  @override
  int get hashCode => word.hashCode ^ meanings.hashCode;
}
