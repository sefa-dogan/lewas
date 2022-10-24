// ignore_for_file: must_be_immutable, unnecessary_string_interpolations

import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:learn_english/model/mobx/is_word_pulled.dart';
import 'package:learn_english/operations/check_remaining_right_versus_pulled_daily_right.dart';
import 'package:learn_english/operations/pull_user_right.dart';
import 'package:learn_english/widgets/menuBari.dart';
import 'package:learn_english/model/word_model.dart';
import 'package:learn_english/operations/pull_word_operations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: no_logic_in_create_state
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState();
  List<WordModel> learnedWords = [];
  // final int _limit = 3;
  int _scoreOfLearnedWords = 0;
  // ignore: non_constant_identifier_names
  late Future _KelimelerveAnlamlariFutureListe;
  late List<WordModel> _kelimelerveanlamlariListe;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String userID;
  late int _userDailyRight;
  final IsWordPulledMobx _controlIsWordPulled = IsWordPulledMobx();
  late Future<int> dailyRight;
  final _remainingDailyRight = 0;

  @override
  void initState() {
    super.initState();
    userID = _auth.currentUser!.uid;
    dailyRight = PullUserRight().UserRightsControl(userID);
    _KelimelerveAnlamlariFutureListe =
        PullWord("https://api.dictionaryapi.dev/api/v2/entries/en/").pullWord();
  }

  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    int _random = 0;
    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size(10, 10),
          child: Text(
            "Learn English Words And Speak",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        title: const Center(
            child: Text(
          "LEWAS",
          style: TextStyle(color: Colors.purple, fontSize: 24),
        )),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SizedBox(
              width: 300,
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureBuilder(
                    future: dailyRight,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        _userDailyRight = snapshot.data!;
                        return _userDailyRight == _remainingDailyRight
                            ? const Text(
                                "Out of your limit",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 20),
                              )
                            : FutureBuilder<dynamic>(
                                future: _KelimelerveAnlamlariFutureListe,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    _kelimelerveanlamlariListe = snapshot.data;
                                    if (_kelimelerveanlamlariListe.isNotEmpty) {
                                      _controlIsWordPulled.isWordPulled = true;
                                      _random = Random().nextInt(
                                          _kelimelerveanlamlariListe.length);
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(_kelimelerveanlamlariListe[
                                                      _random]
                                                  .word),
                                              IconButton(
                                                  onPressed: () {
                                                    _kelimelerveanlamlariListe[
                                                            _random]
                                                        .meanings[0]
                                                        .definitions[0]
                                                        .definition;
                                                  },
                                                  icon: const Icon(
                                                      Icons.volume_down))
                                            ],
                                          ),
                                          Text(_kelimelerveanlamlariListe[
                                                  _random]
                                              .meanings[0]
                                              .definitions[0]
                                              .definition)
                                        ],
                                      );
                                    } else {
                                      return const AlertDialog(
                                        title: Text("Kelimeler tükendi."),
                                      );
                                    }
                                  } else if (snapshot.hasError) {
                                    return Text(snapshot.error.toString());
                                  } else {
                                    return const CircularProgressIndicator();
                                  }
                                },
                              );
                      } else if (snapshot.hasError) {
                        return const AlertDialog(
                          title: Text(
                              "Günlük hak sayısı alınırken bir sorun ile karşılaşldı."),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                  Row(
                    children: [
                      Expanded(child: Observer(builder: (_) {
                        return ElevatedButton(
                            onPressed:
                                _controlIsWordPulled.isWordPulled == false
                                    ? null
                                    : () async {
                                        Map<String, dynamic> result =
                                            await CheckRemainingRightVersusPulledDailyRight()
                                                .checkRemainingRightVersusPulledDailyRight(
                                                    context,
                                                    userID,
                                                    _random,
                                                    _scoreOfLearnedWords,
                                                    _userDailyRight,
                                                    _kelimelerveanlamlariListe,
                                                    learnedWords);
                                        _kelimelerveanlamlariListe =
                                            result["kelimelerveanlamlariListe"];
                                        learnedWords = result["learnedWords"];
                                        if (_scoreOfLearnedWords <
                                            result["scoreOfLearnedWords"]) {
                                          _scoreOfLearnedWords =
                                              result["scoreOfLearnedWords"];
                                          setState(() {});
                                        }
                                      },
                            child: const Text("Learned"));
                      })),
                      Expanded(child: Observer(
                        builder: (context) {
                          return ElevatedButton(
                              onPressed: _controlIsWordPulled.isWordPulled ==
                                      false
                                  ? null
                                  : () {
                                      _userDailyRight != _scoreOfLearnedWords
                                          ? setState(() {})
                                          : showDialog(
                                              context: context,
                                              builder: (context) {
                                                return const AlertDialog(
                                                  title: Text(
                                                      "Günlük limite ulaştınız"),
                                                );
                                              });
                                    },
                              child: const Text("Remind me later"));
                        },
                      ))
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MenuBari().createBar(context))),
        ],
      ),
    );
  }
}
