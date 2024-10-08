import 'package:brasileirao_app/models/competition_match_details.dart';
import 'package:brasileirao_app/widgets/Images/shield.dart';
import 'package:flutter/material.dart';

class MatchDetails extends StatelessWidget {
  final CompetitionMatchDetails match;

  const MatchDetails({
    super.key,
    required this.match,
  });

  @override
  Widget build(BuildContext context) {
    String getAssetImageById(String id) {
      return 'assets/images/id_$id.svg';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Text('${match.arena} - ${match.date} ${match.time}'),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                match.homeTeam.aka ?? '',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(width: 16),
              Shield(
                  imageSrc: getAssetImageById(
                    match.homeTeam.teamId.toString(),
                  ),
                  isAsset: true),
              const SizedBox(width: 16),
              Text(
                '${match.homeScore ?? " - "} x ${match.visitorsScore ?? " - "}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 16),
              Shield(
                  imageSrc: getAssetImageById(
                    match.visitorsTeam.teamId.toString(),
                  ),
                  isAsset: true),
              const SizedBox(width: 16),
              Text(
                match.visitorsTeam.aka ?? '',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
