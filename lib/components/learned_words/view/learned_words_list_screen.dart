import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:learn_english/components/learned_words/view/widgets/learned_word_card.dart';

import 'package:learn_english/components/learned_words/viewmodel/learned_words_viewmodel.dart';
import 'package:learn_english/locator.dart';
import 'package:learn_english/utils/atomic_widgets/bottom_menu_bar.dart';
import 'package:learn_english/utils/constants/app_constants.dart';

class LearnedWordsListScreen extends StatefulWidget {
  const LearnedWordsListScreen({super.key});

  @override
  State<LearnedWordsListScreen> createState() => _LearnedWordsListScreenState();
}

class _LearnedWordsListScreenState extends State<LearnedWordsListScreen> {
  final viewModel = locator<LearnedWordsViewModel>();
  @override
  void initState() {
    super.initState();
    viewModel.getLearnedWordsAndMeans();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size(10, 10),
          child: Text(
            AppConstants.subTitle,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        title: const Center(
          child: Text(
            AppConstants.appTitle,
            style: TextStyle(color: Colors.purple, fontSize: 24),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Learned Words",
            style: TextStyle(fontSize: 24),
          ),
          Observer(builder: (_) {
            if (viewModel.isLearnedWordsAndMeansPulled) {
              return Expanded(
                child: Stack(children: [
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: viewModel.learnedWordsAndMeaningsModel.length,
                    itemBuilder: (context, index) {
                      return LearnedWordCard(
                        learnedItem:
                            viewModel.learnedWordsAndMeaningsModel[index],
                      );
                    },
                  ),
                  Center(child: viewModel.isDeleting?const CircularProgressIndicator():const SizedBox()),
                ]),
              );
            } else {
              return const Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator());
            }
          }),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomMenuBar(),
          )
        ],
      ),
    );
  }
}
