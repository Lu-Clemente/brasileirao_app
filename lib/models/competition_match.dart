import 'package:brasileirao_app/models/team.dart';

enum MatchStatus { SCHEDULED, FINISHED }

class CompetitionMatch {
  final int matchId;
  final String slug;
  final String date;
  final String time;
  final String dateIso;
  final MatchStatus status;
  final Team homeTeam;
  final Team visitorsTeam;
  final String arena;

  CompetitionMatch({
    required this.matchId,
    required this.slug,
    required this.date,
    required this.time,
    required this.dateIso,
    required this.status,
    required this.homeTeam,
    required this.visitorsTeam,
    required this.arena,
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

  factory CompetitionMatch.fromJson(Map<String, dynamic> json) {
    return CompetitionMatch(
      matchId: json['partida_id'],
      slug: json['slug'],
      date: json['data_realizacao'],
      time: json['hora_realizacao'],
      dateIso: json['data_realizacao_iso'],
      status: _parseStatus(json['status']),
      homeTeam: Team.fromJson(json['time_mandante']),
      visitorsTeam: Team.fromJson(json['time_visitante']),
      arena: json['estadio']['nome_popular'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'partida_id': matchId,
      'slug': slug,
      'data_realizacao': date,
      'hora_realizacao': time,
      'data_realizacao_iso': dateIso,
      'status': _statusToString(status),
      'time_mandante': homeTeam.toJson(),
      'time_visitante': visitorsTeam.toJson(),
      'estadio': {'nome_popular': arena},
    };
  }
}
