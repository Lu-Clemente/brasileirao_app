import 'package:brasileirao_app/models/round.dart';
import 'package:brasileirao_app/widgets/Buttons/arrow_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundsNavigator extends StatelessWidget {
  final VoidCallback onPreviousPressed;
  final VoidCallback onNextPressed;
  final Rx<Round> currentRound;

  const RoundsNavigator({
    super.key,
    required this.onPreviousPressed,
    required this.onNextPressed,
    required this.currentRound,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ArrowButton(
          icon: Icons.arrow_back_ios,
          onPressed: onPreviousPressed,
        ),
        Obx(
          () => Text(
            currentRound.value.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ArrowButton(
          icon: Icons.arrow_forward_ios,
          onPressed: onNextPressed,
        ),
      ],
    );
  }
}
