import 'package:brasileirao_app/interfaces/http_client_interface.dart';
import 'package:dio/dio.dart';

class DioClient implements IHttpClient {
  final Dio dio;

  // Dependency injection via constructor
  DioClient({required this.dio});

  @override
  Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    final response = await dio.get(
      url,
      options: Options(
        headers: headers,
      ),
    );
    return response.data;
  }
}
