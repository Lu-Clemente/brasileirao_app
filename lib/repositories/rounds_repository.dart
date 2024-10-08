import 'package:brasileirao_app/models/round.dart';
import 'package:brasileirao_app/models/round_details.dart';
import 'package:brasileirao_app/services/brasileirao_service.dart';

class RoundsRepository {
  final BrasileiraoService _brasileiraoService;

  RoundsRepository(this._brasileiraoService);

  Future<List<Round>> getRounds() async {
    return _brasileiraoService.getBrasileiraoRounds();
  }

  Future<RoundDetails> getRoundByNumber(int roundNumber) async {
    return _brasileiraoService.getBrasileiraoMatchesByRound(roundNumber);
  }
}
