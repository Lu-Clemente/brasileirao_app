import 'package:brasileirao_app/controllers/standings_controller.dart';
import 'package:brasileirao_app/widgets/Images/shield.dart';
import 'package:flutter/material.dart';

class StandingsList extends StatelessWidget {
  final StandingsController standingsController;

  const StandingsList({
    super.key,
    required this.standingsController,
  });

  @override
  Widget build(BuildContext context) {
    String getAssetImageById(String id) {
      return 'assets/images/id_$id.svg';
    }

    return ListView.separated(
      itemCount: standingsController.standings.length,
      separatorBuilder: (BuildContext ctx, int index) => const Divider(),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      itemBuilder: (context, index) {
        final standing = standingsController.standings[index];
        return ListTile(
          leading: Shield(
            imageSrc: getAssetImageById(
              standing.team.teamId.toString(),
            ),
            fit: BoxFit.contain,
            isAsset: true,
          ),
          title: Text(standing.team.aka ?? ''),
          trailing: Text('Pts: ${standing.points}'),
        );
      },
    );
  }
}
