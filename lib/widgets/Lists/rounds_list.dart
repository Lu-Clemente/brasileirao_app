import 'package:brasileirao_app/controllers/rounds_controller.dart';
import 'package:brasileirao_app/models/round.dart';
import 'package:brasileirao_app/screens/standings_screen.dart';
import 'package:brasileirao_app/widgets/Rounds/rounds_navigator.dart';
import 'package:brasileirao_app/widgets/Rounds/match_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundsList extends StatelessWidget {
  final ScrollController scrollController;
  final RoundsController roundsController;

  RoundsList({
    super.key,
    required this.roundsController,
    required this.scrollController,
  }) {
    if (roundsController.currentRound.value.roundNumber == 0) {
      getCurrentRoundByStatus();
    }
  }

  void getCurrentRoundByStatus() {
    for (final round in roundsController.rounds) {
      if (round.status == RoundStatus.scheduled) {
        roundsController.setCurrentRound(round);
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 18,
            right: 12,
          ),
          child: TextButton.icon(
            onPressed: () {
              Get.to(() => StandingsScreen());
            },
            icon: const Icon(
              Icons.arrow_forward_rounded,
              color: Colors.black,
            ),
            label: const Text(
              'Tabela',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFFffd706),
            ),
          ),
        ),
        RoundsNavigator(
          currentRound: roundsController.currentRound,
          onPreviousPressed: () {
            roundsController.previousRound();
          },
          onNextPressed: () {
            roundsController.nextRound();
          },
        ),
        Expanded(
          child: Obx(
            () => ListView.separated(
              controller: scrollController,
              itemCount: roundsController.matchesByRound.length,
              separatorBuilder: (BuildContext ctx, int index) =>
                  const Divider(),
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
              itemBuilder: (context, index) {
                return MatchDetails(
                  match: roundsController.matchesByRound[index],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
