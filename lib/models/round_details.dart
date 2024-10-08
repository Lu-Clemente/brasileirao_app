import 'package:brasileirao_app/models/competition_match.dart';
import 'package:brasileirao_app/models/competition_match_details.dart';
import 'package:brasileirao_app/models/round.dart';
import 'package:brasileirao_app/models/round_slug.dart';

class RoundDetails {
  final int roundNumber;
  final String name;
  final RoundStatus status;
  final Round? nextRound;
  final Round? previousRound;
  /* final List<CompetitionMatch> matches; */
  final List<CompetitionMatchDetails> matches;

  RoundDetails({
    required this.roundNumber,
    required this.name,
    required this.status,
    this.nextRound,
    this.previousRound,
    required this.matches,
  });

  static RoundStatus _parseStatus(String status) {
    switch (status) {
      case 'agendada':
        return RoundStatus.scheduled;
      case 'encerrada':
        return RoundStatus.finished;
      default:
        throw Exception('Invalid status');
    }
  }

  static String _statusToString(RoundStatus status) {
    switch (status) {
      case RoundStatus.scheduled:
        return 'agendada';
      case RoundStatus.finished:
        return 'encerrada';
    }
  }

  factory RoundDetails.fromJson(Map<String, dynamic> json) {
    return RoundDetails(
      roundNumber: json['rodada'],
      name: json['nome'],
      status: _parseStatus(json['status']),
      nextRound: json['proxima_rodada'] != null
          ? Round.fromJson(json['proxima_rodada'])
          : null,
      previousRound: json['rodada_anterior'] != null
          ? Round.fromJson(json['rodada_anterior'])
          : null,
      matches: (json['partidas'] as List)
          .map((e) => CompetitionMatchDetails.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rodada': roundNumber,
      'nome': name,
      'status': _statusToString(status),
      'proxima_rodada': nextRound?.toJson(),
      'rodada_anterior': previousRound?.toJson(),
      'partidas': matches.map((e) => e.toJson()).toList(),
    };
  }
}
