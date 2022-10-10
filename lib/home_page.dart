import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learn_english/menuBari.dart';
import 'package:learn_english/model/word_model.dart';
import 'package:learn_english/pull_word.dart';
import 'package:learn_english/user_informations.dart';
import 'package:learn_english/word_operations.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Map<String, dynamic> words = {
  //   "table": "masa",
  //   "mouse": "fare",
  //   "glasses": "gözlük",
  //   "bag": "çanta",
  //   "smoke": "sigara icmek",
  //   "keyboard": "klavye"
  // };

  List<dynamic> learnedWords = [];
  final int _limit = 3;
  int _scoreOfLearnedWords = 0;
  late Future<List<WordModel>> _KelimeVeAnlamlariFutureListe;
  late List<WordModel> _kelimelerveanlamlariListe;

  @override
  void initState() {
    _KelimeVeAnlamlariFutureListe =
        PullWord("https://api.dictionaryapi.dev/api/v2/entries/en/").pullWord();
  }

  @override
  Widget build(BuildContext context) {
    // List suankiKelimeVeAnlami = WordOperations(words).ReturnRandomWord();
    int _random = 0;
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          child: Text(
            "Learn English Words And Speak",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          preferredSize: Size(10, 10),
        ),
        title: Center(
            child: Text(
          "LEWAS",
          style: TextStyle(color: Colors.purple, fontSize: 24),
        )),
        automaticallyImplyLeading: false, // yeni bir sayfa açıldığ
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 300,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: FutureBuilder<dynamic>(
                  future: _KelimeVeAnlamlariFutureListe,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      _kelimelerveanlamlariListe = snapshot.data;
                      
                      _random =
                          Random().nextInt(_kelimelerveanlamlariListe.length);
                      return Column(
                        children: [
                          Text(_kelimelerveanlamlariListe[_random].word),
                          Text(_kelimelerveanlamlariListe[_random].phonetic)
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return SizedBox();
                    }
                  },
                )),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              Check(_random);
                              //LEARNED BUTONUNA BASILDIĞINDA İLGİLİ KELİMENİN KEY BİLGİSİNİ LEARNEDWORDS LİSTESİNE EKLE VE  KELİMELER MAP İNDEN SİL
                            },
                            child: Text("Learned"))),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            _limit != _scoreOfLearnedWords
                                ? setState(() {})
                                : showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Günlük limite ulaştınız"),
                                      );
                                    });
                            //Remind me later BUTONUNA BASILDIĞINDA KELİMELER MAPİNDEN TEKRAR RASTGELE KELİME GÖSTER
                          },
                          child: Text("Remind me later")),
                    )
                  ],
                )
              ],
            ),
          ),
          MenuBari().createBar(context),
        ],
      ),
    );
  }

  void Check(int suankiKelimeVeAnlamiIndex) {
    if (_scoreOfLearnedWords != _limit) {
      learnedWords.add(_kelimelerveanlamlariListe[suankiKelimeVeAnlamiIndex]);
      _kelimelerveanlamlariListe.removeAt(suankiKelimeVeAnlamiIndex);
      ++_scoreOfLearnedWords == _limit
          ? showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Günlük limite ulaştınız"),
                );
              })
          : setState(() {});
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Günlük limite ulaştınız"),
            );
          });
    }
  }
}
