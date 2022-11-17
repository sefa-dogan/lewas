import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:learn_english/components/home/viewmodel/home_viewmodel.dart';
import 'package:learn_english/locator.dart';
import 'package:learn_english/utils/atomic_widgets/elevated_button.dart';

class LearnedAndRemind extends StatefulWidget {
  const LearnedAndRemind({super.key});

  @override
  State<LearnedAndRemind> createState() => _LearnedAndRemindState();
}

class _LearnedAndRemindState extends State<LearnedAndRemind> {
  final viewModel = locator<HomeViewModel>();
  int count = 0;

  @override
  Widget build(BuildContext context) {
  viewModel.isButtonsActive=false;
    return Row(
      children: [
        Expanded(child: Observer(builder: (_) {
          count++;
          debugPrint("Learned butonunun build olma sayısı: $count");
          return GenericElevatedButton(
            childWidget: const Text("Learned"),
            onPressedFunc: (viewModel.isButtonsActive)
                ? viewModel.checkRemainingRightVersusPulledDailyRight
                : null,
          );
        })),
        Expanded(child: Observer(
          builder: (_) {
            return GenericElevatedButton(
                childWidget: const Text("Remind me later"),
                onPressedFunc: viewModel.isButtonsActive
                    ? viewModel.setRandomWordIndexRightNow
                    : null);
          },
        )),
      ],
    );
  }
}
