import 'dart:convert';
import 'package:brasileirao_app/services/brasileirao_service.dart';
import 'package:brasileirao_app/services/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../__mocks__/standings_mock.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late DioClient dioClient;

  setUp(() {
    // Initialize mock Dio and inject it into DioClient via constructor
    mockDio = MockDio();
    dioClient = DioClient(dio: mockDio);
  });

  test('should return data when Dio get request is successful', () async {
    // Arrange: Create a mock response for Dio
    const url = 'https://example.com';
    final mockResponse = Response(
      requestOptions: RequestOptions(path: url),
      data: {'key': 'value'}, // Mocked data response
      statusCode: 200,
    );

    // Mock the behavior of dio.get to return the mockResponse
    when(() => mockDio.get(url, options: any(named: 'options')))
        .thenAnswer((_) async => mockResponse);

    // Act: Call the get method on DioClient
    final result = await dioClient.get(url);

    // Assert: Verify that the result matches the mocked response
    expect(result, equals({'key': 'value'}));
    verify(() => mockDio.get(url, options: any(named: 'options'))).called(1);
  });

  test('should throw an error when Dio get request fails', () async {
    // Arrange: Mock Dio to throw a DioException when calling get
    const url = 'https://example.com';
    final errorResponse = DioException(
      requestOptions: RequestOptions(path: url),
      response: Response(
        requestOptions: RequestOptions(path: url),
        statusCode: 404,
      ),
      type: DioExceptionType.badResponse,
    );

    when(() => mockDio.get(url, options: any(named: 'options')))
        .thenThrow(errorResponse);

    // Act & Assert: Verify that an exception is thrown
    expect(() => dioClient.get(url), throwsA(isA<DioException>()));
    verify(() => mockDio.get(url, options: any(named: 'options'))).called(1);
  });

  test('should return 20 results when calling the BrasileiraoService',
      () async {
    // Arrange: Create a mock response for Dio
    const url = 'https://api.api-futebol.com.br/v1/campeonatos/10/tabela';
    final mockResponse = Response(
      requestOptions: RequestOptions(path: url),
      data: jsonDecode(standingsMock), // Mocked data response
      statusCode: 200,
    );

    // Mock the behavior of dio.get to return the mockResponse
    when(() => mockDio.get(url, options: any(named: 'options')))
        .thenAnswer((_) async => mockResponse);

    // Act: Call the get method on DioClient
    final brasileiraoService = BrasileiraoService(dioClient);
    final result = await brasileiraoService.getBrasileiraoStandings();

    // Assert: Verify that the result matches the mocked response
    expect(result.length, 20);
    verify(() => mockDio.get(url, options: any(named: 'options'))).called(1);
  });
}
