import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/model/word_model.dart';

class CheckRemainingRightVersusPulledDailyRight {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> checkRemainingRightVersusPulledDailyRight(
      BuildContext context,
      String userID,
      int suankiKelimeVeAnlamiIndex,
      int _scoreOfLearnedWords,
      int _dailyRight,
      List<WordModel> _kelimelerveanlamlariListe,
      List<WordModel> learnedWords) async {
    if (_scoreOfLearnedWords != _dailyRight) {
      learnedWords.add(_kelimelerveanlamlariListe[suankiKelimeVeAnlamiIndex]);
      SendLearnedWordToDataBaseWithSet(
          userID,
          _kelimelerveanlamlariListe[suankiKelimeVeAnlamiIndex].word,
          _kelimelerveanlamlariListe[suankiKelimeVeAnlamiIndex]
              .meanings[0]
              .definitions[0]
              .definition);
      _kelimelerveanlamlariListe.removeAt(suankiKelimeVeAnlamiIndex);
      _scoreOfLearnedWords++;
      if (_scoreOfLearnedWords == _dailyRight) {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text("Günlük limite ulaştınız"),
              );
            });
      }
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text("Günlük limite ulaştınız"),
            );
          });
    }
    return {
      "kelimelerveanlamlariListe": _kelimelerveanlamlariListe,
      "learnedWords": learnedWords,
      "scoreOfLearnedWords": _scoreOfLearnedWords
    };
  }

  // ignore: non_constant_identifier_names
  void SendLearnedWordToDataBaseWithSet(
      String userID, String word, String meaning) async {
    await _firestore
        .doc("students/$userID")
        .collection("learnedwords")
        .doc("learnedwords")
        .set({"$word": "$meaning"}, SetOptions(merge: true));
    await _firestore.doc("students/$userID/Student Info/Student Info").set(
        {"daily right": FieldValue.increment(-1)}, SetOptions(merge: true));
  }
}
