import 'package:brasileirao_app/models/competition_match.dart';
import 'package:brasileirao_app/models/round_slug.dart';

class Matches {
  final Map<RoundSlug, List<CompetitionMatch>> matches;

  Matches({required this.matches});

  factory Matches.fromJson(Map<String, dynamic> json) {
    return Matches(
      matches: (json['partidas']['fase-unica'] as Map<String, dynamic>).map(
        (key, value) {
          return MapEntry(
            RoundSlug(slug: key),
            (value as List<dynamic>)
                .map((e) => CompetitionMatch.fromJson(e))
                .toList(),
          );
        },
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['partidas'] = <String, dynamic>{};
    data['partidas']['fase-unica'] = matches.map(
      (key, value) {
        return MapEntry(
          key.slug,
          value.map((e) => e.toJson()).toList(),
        );
      },
    );
    return data;
  }
}
