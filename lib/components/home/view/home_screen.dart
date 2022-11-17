// ignore_for_file: must_be_immutable, unnecessary_string_interpolations

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/components/home/model/word_model.dart';
import 'package:learn_english/components/home/view/widgets/word_and_meaning.dart';
import 'package:learn_english/components/home/view/widgets/learned_and_remind.dart';
import 'package:learn_english/components/home/viewmodel/home_viewmodel.dart';
import 'package:learn_english/locator.dart';
import 'package:learn_english/utils/atomic_widgets/bottom_menu_bar.dart';
import 'package:learn_english/utils/constants/app_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: no_logic_in_create_state
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  _HomePageState();
  List<WordModel> learnedWords = [];
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String userID;
  final viewModel = locator<HomeViewModel>();

  @override
  void initState() {
    super.initState();
    userID = _auth.currentUser!.uid;
    viewModel.runUserRightsControl();
  }

  // ignore: annotate_overrides
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
        )),
        automaticallyImplyLeading: false,
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Expanded(
            child: Align(
          alignment: Alignment.center,
          child: WordAndMeaning(),
        )),
        const LearnedAndRemind(),
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomMenuBar(),
        )
      ]),
    );
  }
}
