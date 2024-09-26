import 'package:brasileirao_app/models/competition_current_edition.dart';
import 'package:brasileirao_app/models/competition_current_round.dart';

class Competition {
  final String name;
  final int competitionId;
  final String emblemUrl;
  final String aka;
  final CompetitionCurrentEdition currentEdition;
  final int currentPhaseId;
  final String status;
  final CompetitionCurrentRound currentRound;

  Competition({
    required this.name,
    required this.competitionId,
    required this.emblemUrl,
    required this.aka,
    required this.currentEdition,
    required this.currentPhaseId,
    required this.status,
    required this.currentRound,
  });

  factory Competition.fromJson(Map<String, dynamic> json) {
    return Competition(
      name: json['nome'],
      competitionId: json['campeonato_id'],
      emblemUrl: json['logo'],
      aka: json['nome_popular'],
      currentEdition: CompetitionCurrentEdition.fromJson(json['edicao_atual']),
      currentPhaseId: json['fase_atual']['fase_id'],
      status: json['status'],
      currentRound: CompetitionCurrentRound.fromJson(json['rodada_atual']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = name;
    data['campeonato_id'] = competitionId;
    data['logo'] = emblemUrl;
    data['nome_popular'] = aka;
    data['edicao_atual'] = currentEdition.toJson();
    data['fase_atual'] = <String, dynamic>{'fase_id': currentPhaseId};
    data['status'] = status;
    data['rodada_atual'] = currentRound.toJson();
    return data;
  }
}
