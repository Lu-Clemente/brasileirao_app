import 'package:brasileirao_app/interfaces/http_client_interface.dart';
import 'package:brasileirao_app/models/standing.dart';

const url = 'https://api.api-futebol.com.br/v1/campeonatos/10/tabela';

class BrasileiraoService {
  final IHttpClient httpClient;

  BrasileiraoService(this.httpClient);

  Future<List<Standing>> getBrasileiraoStandings() async {
    final body = await httpClient.get(
      url,
      headers: {
        'Authorization': 'Bearer live_ca38c9fad0f6f801810beedb25c70a',
      },
    );
    return body.map<Standing>((standing) {
      return Standing.fromJson(standing);
    }).toList();
  }
}
