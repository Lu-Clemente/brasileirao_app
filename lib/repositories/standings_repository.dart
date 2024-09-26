import 'package:brasileirao_app/models/standing.dart';
import 'package:brasileirao_app/services/brasileirao_service.dart';

class StandingsRepository {
  final BrasileiraoService _brasileiraoService;

  StandingsRepository(this._brasileiraoService);

  Future<List<Standing>> getStandings() async {
    return _brasileiraoService.getBrasileiraoStandings();
  }
}
