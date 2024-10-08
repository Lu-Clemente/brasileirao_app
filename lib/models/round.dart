enum RoundStatus { scheduled, finished }

class Round {
  final int roundNumber;
  final String name;
  final String slug;
  final RoundStatus status;

  Round({
    required this.roundNumber,
    required this.name,
    required this.status,
    required this.slug,
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

  factory Round.fromJson(Map<String, dynamic> json) {
    return Round(
      roundNumber: json['rodada'],
      name: json['nome'],
      status: _parseStatus(json['status']),
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rodada': roundNumber,
      'nome': name,
      'status': _statusToString(status),
      'slug': slug,
    };
  }
}
