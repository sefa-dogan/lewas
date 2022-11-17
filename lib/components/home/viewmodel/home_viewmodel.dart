// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
// import 'package:get/get.dart';
import 'package:learn_english/components/home/model/word_model.dart';
// import 'package:learn_english/components/learnedwordsmobx/learned_words_mobx.dart';
import 'package:mobx/mobx.dart';
part 'home_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  List<String> wordList = [
    "pencil",
    "headphone",
    "bag",
    "door",
    "dress",
    "bin",
    // "ring",
    // "laptop",
    // "air",
    // "cable",
    // "shoe",
    // "muscle",
    // "wall",
    // "shelf"
  ];
  final String _apiLink = "https://api.dictionaryapi.dev/api/v2/entries/en/";
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late int _lastOnlineDay;
  int scoreOfLearnedWords = 0;
  // int? _userDailyRight;
  List<String> learnedWordKey = [];
  bool isStartedWordPulling = false;

  var userID;
  int counter = 0;

  List<WordModel> wordAndMeanList = [];
  @observable
  int? userDailyRight;
  @observable
  int randomWordIndexRightNow = 0;
  @observable
  bool isFinishWordPulling = false;
  @observable
  bool isButtonsActive = false;

  @action
  Future<List<WordModel>> pullWord() async {
    List<WordModel> localWordAndMeanList = [];
    List<String> localWordList = [];
    isFinishWordPulling = false;
    Response response;
    var pulledData;
    localWordList.addAll(wordList);
    try {
      for (String word in learnedWordKey) {
        localWordList.remove(word);
      }
      for (int i = 0; i < localWordList.length; i++) {
        // ignore: no_leading_underscores_for_local_identifiers
        counter++;
        response = await Dio().get(_apiLink + localWordList[i]);
        debugPrint("bir kelime çekildi");
        // ignore: no_leading_underscores_for_local_identifiers
        pulledData = response.data;
        List<WordModel> currentWord =
            ((pulledData as List).map((e) => WordModel.fromMap(e)).toList());
        localWordAndMeanList.add(currentWord[0]);
      }
      isStartedWordPulling = false;
      isFinishWordPulling = true;
      return localWordAndMeanList;
    } catch (e) {
      debugPrint(e.toString());
      return Future.error(e);
    }
  }

  @action
  Future<List<String>> pullLearnedWordsKeys() async {
    return (await _firestore
            .doc("students/$userID/learnedwords/learnedwords")
            .get())
        .data()!
        .keys
        .toList();
  }

  @action
  // ignore: non_constant_identifier_names
  Future<int> userRightsControl() async {
    userID = _auth.currentUser!.uid;
    var result = (await _firestore
            .doc("students/$userID/Student Info/Student Info")
            .get())
        .data();
    if (result != null && result["Last Online"] != null) {
      _lastOnlineDay = result["Last Online"];
      // ignore: unrelated_type_equality_checks
      if (_lastOnlineDay != DateTime.now().day) {
        await _firestore
            .doc("students/$userID/Student Info/Student Info")
            .update({"daily right": 10, "Last Online": DateTime.now().day});

        return (await _firestore
                .doc("students/$userID/Student Info/Student Info")
                .get())
            .data()!["daily right"];
      } else {
        return (await _firestore
                .doc("students/$userID/Student Info/Student Info")
                .get())
            .data()!["daily right"];
      }
    } else {
      return Future.error("Belirtilen adres null değer gönderdi.");
    }
  }

  @action
  // ignore: non_constant_identifier_names
  runUserRightsControl() async {
    userDailyRight = await userRightsControl();
  }

  outOfLimitAlert() {
    return const Text(
      "Out of your limit",
      style: TextStyle(color: Colors.red, fontSize: 20),
    );
  }

  outOfStockAlert() async {
    setButtonActivity(false);
    await Get.dialog(const SimpleDialog(
      title: Text("Word stock is out of stock",
          style: TextStyle(color: Colors.red)),
    ));
  }

  @action
  checkRemainingRightVersusPulledDailyRight() async {
    if (scoreOfLearnedWords == userDailyRight) {
      Get.dialog(const SimpleDialog(
        title: Text("Out of your daily limit"),
      ));
    } else {
      if (wordAndMeanList.isNotEmpty) {
        sendLearnedWordToDataBaseWithSet(
            userID,
            wordAndMeanList[randomWordIndexRightNow].word,
            wordAndMeanList[randomWordIndexRightNow]
                .meanings[0]
                .definitions[0]
                .definition);
        wordAndMeanList.removeAt(randomWordIndexRightNow);
        scoreOfLearnedWords++;
        wordAndMeanList.isNotEmpty
            ? setRandomWordIndexRightNow()
            : outOfStockAlert();
      } else {
        outOfStockAlert();
      }
    }
  }

  @action
  // ignore: non_constant_identifier_names
  sendLearnedWordToDataBaseWithSet(
      String userID, String word, String meaning) async {
    await _firestore
        .doc("students/$userID")
        .collection("learnedwords")
        .doc("learnedwords")
        .set({word: meaning}, SetOptions(merge: true));
    await _firestore.doc("students/$userID/Student Info/Student Info").set(
        {"daily right": FieldValue.increment(-1)}, SetOptions(merge: true));
  }

  @action
  setRandomWordIndexRightNow() {
    randomWordIndexRightNow = Random().nextInt(wordAndMeanList.length);
  }

  setButtonActivity(bool value) {
    isButtonsActive = value;
  }
}
