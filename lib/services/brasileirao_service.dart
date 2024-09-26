import 'package:brasileirao_app/interfaces/http_client_interface.dart';
import 'package:brasileirao_app/models/standing.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const url = 'https://api.api-futebol.com.br/v1/campeonatos/10/tabela';

class BrasileiraoService {
  final IHttpClient httpClient;

  BrasileiraoService(this.httpClient);

  final String apiKey = dotenv.env['API_KEY'] ?? '';

  Future<List<Standing>> getBrasileiraoStandings() async {
    final body = await httpClient.get(
      url,
      headers: {
        'Authorization': 'Bearer $apiKey',
      },
    );
    return body.map<Standing>((standing) {
      return Standing.fromJson(standing);
    }).toList();
  }
}
