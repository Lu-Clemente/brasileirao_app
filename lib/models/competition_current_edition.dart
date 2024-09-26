class CompetitionCurrentEdition {
  final int editionId;
  final String name;
  final String season;
  final String popularName;

  CompetitionCurrentEdition({
    required this.editionId,
    required this.name,
    required this.season,
    required this.popularName,
  });

  factory CompetitionCurrentEdition.fromJson(Map<String, dynamic> json) {
    return CompetitionCurrentEdition(
      editionId: json['edicao_id'],
      name: json['nome'],
      season: json['temporada'],
      popularName: json['nome_popular'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['edicao_id'] = editionId;
    data['nome'] = name;
    data['temporada'] = season;
    data['nome_popular'] = popularName;
    return data;
  }
}
