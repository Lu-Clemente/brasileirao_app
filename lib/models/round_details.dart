import 'package:brasileirao_app/models/competition_match.dart';
import 'package:brasileirao_app/models/round.dart';
import 'package:brasileirao_app/models/round_slug.dart';

class RoundDetails {
  final int roundNumber;
  final String name;
  final RoundSlug slug;
  final Status status;
  final Round nextRound;
  final Round previousRound;
  final List<CompetitionMatch> matches;

  RoundDetails({
    required this.roundNumber,
    required this.name,
    required this.status,
    required this.nextRound,
    required this.previousRound,
    required this.matches,
    required this.slug,
  });

  static Status _parseStatus(String status) {
    switch (status) {
      case 'agendada':
        return Status.scheduled;
      case 'encerrada':
        return Status.finished;
      default:
        throw Exception('Invalid status');
    }
  }

  static String _statusToString(Status status) {
    switch (status) {
      case Status.scheduled:
        return 'agendada';
      case Status.finished:
        return 'encerrada';
    }
  }

  factory RoundDetails.fromJson(Map<String, dynamic> json) {
    return RoundDetails(
      roundNumber: json['rodada'],
      name: json['nome'],
      status: _parseStatus(json['status']),
      nextRound: Round.fromJson(json['proxima_rodada']),
      previousRound: Round.fromJson(json['rodada_anterior']),
      matches: (json['partidas'] as List<dynamic>)
          .map((e) => CompetitionMatch.fromJson(e))
          .toList(),
      slug: json['slug'],
    );
  }
}
