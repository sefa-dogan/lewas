import 'package:flutter/material.dart';
import 'package:learn_english/operations/learned_words_operations.dart';
import 'package:learn_english/widgets/menuBari.dart';

class LearnedWords extends StatefulWidget {
  const LearnedWords({super.key});

  @override
  State<LearnedWords> createState() => _LearnedWordsState();
}

class _LearnedWordsState extends State<LearnedWords> {
  late Future<Map<String, dynamic>> _learnedWordsAndMeans;
  @override
  void initState() {
    super.initState();
    _learnedWordsAndMeans = LearnedWordsOperations().pullLearnedWordsAndMeans();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
          // ignore: sort_child_properties_last
          child: Text(
            "Learn English Words And Speak",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          preferredSize: Size(10, 10),
        ),
        title: const Center(
            child: Text(
          "LEWAS",
          style: TextStyle(color: Colors.purple, fontSize: 24),
        )),
        automaticallyImplyLeading: false, // yeni bir sayfa açıldığ
      ),
      body: Column(
        children: [
          const Text(
            "Learned Words",
            style: TextStyle(fontSize: 24),
          ),
          Expanded(
            child: ListView(children: [
              FutureBuilder(
                future: _learnedWordsAndMeans,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Map<String, dynamic> gelenData = snapshot.data!;
                    return Column(
                      children: gelenData.keys
                          .map((word) => Card(
                                child: ListTile(
                                  leading: IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      gelenData.remove(word);
                                      LearnedWordsOperations()
                                          .DeleteLearnedWord(word);
                                      setState(() {});
                                    },
                                  ),
                                  title: Text(word),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(gelenData[word]),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ))
                          .toList()
                      /* gelenData
                          .map((word,mean) => Card(
                                child: GestureDetector(
                                  child: ListTile(
                                    leading: Text(word),
                                  ),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (alertContext) {
                                        return AlertDialog(
                                          // ignore: prefer_interpolation_to_compose_strings
                                          title:
                                              Text(_learnedWordsAndMeans[word]),
                                        );
                                      },
                                    );
                                  },
                                ),
                              )) */
                      ,
                    );
                  } else if (snapshot.hasError) {
                    return const Center();
                  } else {
                    return const SizedBox();
                  }
                },
              )
            ]
                /* _learnedWords
                  .map((word) => Card(
                        child: GestureDetector(
                          child: ListTile(
                            leading: Text(word),
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (alertContext) {
                                return AlertDialog(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  title: Text(_learnedWordsAndMeans[word]),
                                );
                              },
                            );
                          },
                        ),
                      ))
                  .toList(), */
                ),
          ),
          MenuBari().createBar(context)
        ],
      ),
    );
  }
}
