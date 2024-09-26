abstract class IHttpClient {
  Future<dynamic> get(String url, {Map<String, String>? headers});
}
