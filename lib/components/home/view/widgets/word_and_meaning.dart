import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:learn_english/components/home/viewmodel/home_viewmodel.dart';
import 'package:learn_english/locator.dart';

class WordAndMeaning extends StatefulWidget {
  const WordAndMeaning({super.key});

  @override
  State<WordAndMeaning> createState() => _WordAndMeaningState();
}

class _WordAndMeaningState extends State<WordAndMeaning> {
  final viewModel = locator<HomeViewModel>();
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    viewModel.isFinishWordPulling = false;
    if (!viewModel.isFinishWordPulling) {
      viewModel.isStartedWordPulling = true;
      viewModel.learnedWordKey = await viewModel.pullLearnedWordsKeys();
      viewModel.wordAndMeanList = await viewModel.pullWord();
      viewModel.wordAndMeanList.isNotEmpty
          ? viewModel.setRandomWordIndexRightNow()
          : null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (viewModel.userDailyRight == null) {
          return const CircularProgressIndicator();
        } else if (viewModel.userDailyRight == 0) {
          return viewModel.outOfLimitAlert();
        } else if (viewModel.isFinishWordPulling) {
          if (viewModel.wordAndMeanList.isNotEmpty) {
            viewModel.setButtonActivity(true);
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(viewModel
                      .wordAndMeanList[viewModel.randomWordIndexRightNow].word),
                  const Divider(),
                  Text(viewModel
                      .wordAndMeanList[viewModel.randomWordIndexRightNow]
                      .meanings[0]
                      .definitions[0]
                      .definition)
                ]);
          } else {
            viewModel.setButtonActivity(false);
            return const Text("Word stock is out of stock",
                style: TextStyle(color: Colors.red));
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
        // if (viewModel.isStartedWordPulling) {
        //   return const CircularProgressIndicator();
        // } else {
        //   return const SizedBox();
        // }
        // } else if (viewModel.isWordsPulled &&
        //     viewModel.wordAndMeanList.isNotEmpty) {
        //   return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        //     Text(viewModel
        //         .wordAndMeanList[viewModel.randomWordIndexRightNow].word),
        //     const Divider(),
        //     Text(viewModel.wordAndMeanList[viewModel.randomWordIndexRightNow]
        //         .meanings[0].definitions[0].definition)
        //   ]);
        // } else {
        //   return const SizedBox();
        // }
        // return Observer(
        //   builder: (_) {
        //     if (viewModel.isStartedWordPulling) {
        //       return const CircularProgressIndicator();
        //     } else if (viewModel.isWordsPulled &&
        //         viewModel.wordAndMeanList.isNotEmpty) {
        //       return Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Text(viewModel
        //                 .wordAndMeanList[viewModel.randomWordIndexRightNow]
        //                 .word),
        //             const Divider(),
        //             Text(viewModel
        //                 .wordAndMeanList[viewModel.randomWordIndexRightNow]
        //                 .meanings[0]
        //                 .definitions[0]
        //                 .definition)
        //           ]);
        //     } else {
        //       return const SizedBox();
        //     }
        //   },
        // );
        // } else if (viewModel.isWordsPulled) {
        //   return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        //     Text(viewModel
        //         .wordAndMeanList[viewModel.randomWordIndexRightNow].word),
        //     const Divider(),
        //     Text(viewModel.wordAndMeanList[viewModel.randomWordIndexRightNow]
        //         .meanings[0].definitions[0].definition)
        //   ]);
        // }
        // return const SizedBox();
