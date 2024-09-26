import 'package:brasileirao_app/models/team.dart';

enum MatchResult { win, draw, loss }

class Standing {
  final int position;
  final Team team;
  final int playedGames;
  final int won;
  final int draw;
  final int lost;
  final int points;
  final int goalsFor;
  final int goalsAgainst;
  final int goalDifference;
  final int efficiency;
  final List<MatchResult> lastFiveMatches;

  Standing({
    required this.position,
    required this.team,
    required this.playedGames,
    required this.won,
    required this.draw,
    required this.lost,
    required this.points,
    required this.goalsFor,
    required this.goalsAgainst,
    required this.goalDifference,
    required this.efficiency,
    required this.lastFiveMatches,
  });

  static List<MatchResult> _parseLastFiveMatches(List<dynamic> matches) {
    return matches.map((match) {
      switch (match) {
        case 'v':
          return MatchResult.win;
        case 'e':
          return MatchResult.draw;
        case 'd':
          return MatchResult.loss;
        default:
          throw Exception('Invalid match result');
      }
    }).toList();
  }

  static List<String> _lastFiveMathesToString(List<MatchResult> matches) {
    return matches.map((match) {
      switch (match) {
        case MatchResult.win:
          return 'v';
        case MatchResult.draw:
          return 'e';
        case MatchResult.loss:
          return 'd';
      }
    }).toList();
  }

  factory Standing.fromJson(Map<String, dynamic> json) {
    return Standing(
      position: json['posicao'],
      team: Team.fromJson(json['time']),
      playedGames: json['jogos'],
      won: json['vitorias'],
      draw: json['empates'],
      lost: json['derrotas'],
      points: json['pontos'],
      goalsFor: json['gols_pro'],
      goalsAgainst: json['gols_contra'],
      goalDifference: json['saldo_gols'],
      efficiency: json['aproveitamento'],
      lastFiveMatches: _parseLastFiveMatches(json['ultimos_jogos']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['posicao'] = position;
    data['time'] = team.toJson();
    data['jogos'] = playedGames;
    data['vitorias'] = won;
    data['empates'] = draw;
    data['derrotas'] = lost;
    data['points'] = points;
    data['gols_pro'] = goalsFor;
    data['gols_contra'] = goalsAgainst;
    data['saldo_gols'] = goalDifference;
    data['aproveitamento'] = efficiency;
    data['ultimos_jogos'] = _lastFiveMathesToString(lastFiveMatches);
    return data;
  }
}
