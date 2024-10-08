import 'package:brasileirao_app/controllers/standings_controller.dart';
import 'package:brasileirao_app/models/standing.dart';
import 'package:brasileirao_app/widgets/Images/shield.dart';
import 'package:flutter/material.dart';

class StandingsList extends StatelessWidget {
  final StandingsController standingsController;

  const StandingsList({
    super.key,
    required this.standingsController,
  });

  Color getMatchResultColor(MatchResult match) {
    switch (match) {
      case MatchResult.win:
        return const Color(0xFF34A853);
      case MatchResult.draw:
        return const Color(0xFF9D9BA7);
      case MatchResult.loss:
        return const Color(0xFFEA4335);
    }
  }

  @override
  Widget build(BuildContext context) {
    String getAssetImageById(String id) {
      return 'assets/images/id_$id.svg';
    }

    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: constraints.maxWidth,
            child: DataTable(
              columnSpacing: 16,
              columns: const [
                DataColumn(label: Text('Classificação')),
                DataColumn(label: Text('VIT')),
                DataColumn(label: Text('E')),
                DataColumn(label: Text('DER')),
                DataColumn(label: Text('Pts')),
                DataColumn(label: Text('Últimos 5')),
              ],
              rows: standingsController.standings.map((team) {
                final clubDetail = team.team;
                return DataRow(cells: [
                  DataCell(
                    Row(
                      children: [
                        Text(team.position.toString()),
                        const SizedBox(width: 16),
                        Shield(
                          imageSrc: getAssetImageById(
                            clubDetail.teamId.toString(),
                          ),
                          fit: BoxFit.contain,
                          isAsset: true,
                        ),
                        const SizedBox(width: 16),
                        Text(clubDetail.acronym),
                      ],
                    ),
                  ),
                  DataCell(Text(team.won.toString())),
                  DataCell(Text(team.draw.toString())),
                  DataCell(Text(team.lost.toString())),
                  DataCell(Text(team.points.toString())),
                  DataCell(
                    Row(
                      children: team.lastFiveMatches.map((match) {
                        return Container(
                          width: 12,
                          height: 12,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            color: getMatchResultColor(match),
                            shape: BoxShape.circle,
                          ),
                          child: const Text(''),
                        );
                      }).toList(),
                    ),
                  ),
                ]);
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
