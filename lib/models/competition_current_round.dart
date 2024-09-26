class CompetitionCurrentRound {
  int round;
  String name;
  String status;

  CompetitionCurrentRound({
    required this.round,
    required this.name,
    required this.status,
  });

  factory CompetitionCurrentRound.fromJson(Map<String, dynamic> json) {
    return CompetitionCurrentRound(
      round: json['rodada'],
      name: json['nome'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rodada'] = round;
    data['nome'] = name;
    data['status'] = status;
    return data;
  }
}
