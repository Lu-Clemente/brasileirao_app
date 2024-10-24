import 'package:brasileirao_app/models/team.dart';

enum MatchStatus { SCHEDULED, FINISHED }

class CompetitionMatchDetails {
  final int matchId;
  final String slug;
  final String date;
  final String time;
  final String dateIso;
  final MatchStatus status;
  final Team homeTeam;
  final Team visitorsTeam;
  final String result;
  final String arena;
  final int? visitorsScore;
  final int? homeScore;

  CompetitionMatchDetails({
    required this.matchId,
    required this.result,
    required this.slug,
    required this.date,
    required this.time,
    required this.dateIso,
    required this.status,
    required this.arena,
    this.visitorsScore,
    this.homeScore,
    required this.homeTeam,
    required this.visitorsTeam,
  });

  static MatchStatus _parseStatus(String status) {
    switch (status) {
      case 'agendado':
        return MatchStatus.SCHEDULED;
      case 'finalizado':
        return MatchStatus.FINISHED;
      default:
        throw Exception('Invalid status');
    }
  }

  static String _statusToString(MatchStatus status) {
    switch (status) {
      case MatchStatus.SCHEDULED:
        return 'agendado';
      case MatchStatus.FINISHED:
        return 'finalizado';
    }
  }

  factory CompetitionMatchDetails.fromJson(Map<String, dynamic> json) {
    return CompetitionMatchDetails(
      matchId: json['partida_id'],
      result: json['placar'],
      slug: json['slug'],
      date: json['data_realizacao'],
      time: json['hora_realizacao'],
      dateIso: json['data_realizacao_iso'],
      status: _parseStatus(json['status']),
      arena: json['estadio']['nome_popular'],
      visitorsScore: json['placar_visitante'],
      homeScore: json['placar_mandante'],
      homeTeam: Team.fromJson(json['time_mandante']),
      visitorsTeam: Team.fromJson(json['time_visitante']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'partida_id': matchId,
      'placar': result,
      'slug': slug,
      'data_realizacao': date,
      'hora_realizacao': time,
      'data_realizacao_iso': dateIso,
      'status': _statusToString(status),
      'estadio': {'nome_popular': arena},
      'placar_visitante': visitorsScore,
      'placar_mandante': homeScore,
      'time_mandante': homeTeam.toJson(),
      'time_visitante': visitorsTeam.toJson(),
    };
  }
}
