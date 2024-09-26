enum Status { scheduled, finished }

class Round {
  final int roundNumber;
  final String name;
  final String slug;
  final Status status;

  Round({
    required this.roundNumber,
    required this.name,
    required this.status,
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
