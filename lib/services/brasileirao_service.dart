import 'package:brasileirao_app/controllers/is_dev_env.dart';
import 'package:brasileirao_app/interfaces/http_client_interface.dart';
import 'package:brasileirao_app/models/round.dart';
import 'package:brasileirao_app/models/round_details.dart';
import 'package:brasileirao_app/models/standing.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const baseUrl = 'https://api.api-futebol.com.br/v1';

class BrasileiraoService {
  final IHttpClient httpClient;

  BrasileiraoService(this.httpClient);

  final String apiKey =
      dotenv.env[isDevEnv() ? 'API_KEY_TEST' : 'API_KEY'] ?? '';

  Future<List<Standing>> getBrasileiraoStandings() async {
    final body = await httpClient.get(
      '$baseUrl/campeonatos/10/tabela',
      headers: {
        'Authorization': 'Bearer $apiKey',
      },
    );
    return body.map<Standing>((standing) {
      return Standing.fromJson(standing);
    }).toList();
  }

  Future<List<Round>> getBrasileiraoRounds() async {
    final body = await httpClient.get(
      '$baseUrl/campeonatos/10/rodadas',
      headers: {
        'Authorization': 'Bearer $apiKey',
      },
    );
    return body.map<Round>((round) {
      return Round.fromJson(round);
    }).toList();
  }

  Future<RoundDetails> getBrasileiraoMatchesByRound(int roundNumber) async {
    final body = await httpClient.get(
      '$baseUrl/campeonatos/10/rodadas/$roundNumber',
      headers: {
        'Authorization': 'Bearer $apiKey',
      },
    );
    return RoundDetails.fromJson(body);
  }
}
