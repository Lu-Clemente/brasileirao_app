class Team {
  final String? name;
  final String? aka;
  final String acronym;
  final String shield;
  final int teamId;

  Team({
    this.name,
    this.aka,
    required this.acronym,
    required this.shield,
    required this.teamId,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      name: json['nome'],
      aka: json['nome_popular'],
      acronym: json['sigla'],
      shield: json['escudo'],
      teamId: json['time_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = name;
    data['nome_popular'] = aka;
    data['sigla'] = acronym;
    data['escudo'] = shield;
    data['time_id'] = teamId;
    return data;
  }
}
