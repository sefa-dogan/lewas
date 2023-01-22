import 'package:flutter/material.dart';
import 'package:learn_english/components/learned_words/model/learned_word.dart';
import 'package:learn_english/locator.dart';

import '../../viewmodel/learned_words_viewmodel.dart';

class LearnedWordCard extends StatefulWidget {
  const LearnedWordCard({super.key, required this.learnedItem});
  final LearnedWord learnedItem;

  @override
  State<LearnedWordCard> createState() => _LearnedWordsListItemState();
}

class _LearnedWordsListItemState extends State<LearnedWordCard> {
  final viewModel = locator<LearnedWordsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.learnedItem.word),
        leading: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              viewModel.isDeleting = true;
              await viewModel.deleteLearnedWord(widget.learnedItem);
            }),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                    widget.learnedItem.meanings[0].definitions[0].definition),
              );
            },
          );
        },
      ),
    );
  }
}
