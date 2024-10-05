import 'dart:convert';
import 'package:brasileirao_app/interfaces/http_client_interface.dart';
import 'package:brasileirao_app/services/brasileirao_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../__mocks__/standings_mock.dart';

class IHttpClientMock extends Mock implements IHttpClient {}

void main() {
  test("brasileirao service should list the competition's standings", () async {
    // Arrange: Create a mock response for Dio
    final responseMock = jsonDecode(standingsMock);
    final client = IHttpClientMock();

    // Mock the behavior of dio.get to return the mockResponse
    when(
      () => client.get(url, headers: any(named: 'headers')),
    ).thenAnswer(
      (_) async => responseMock,
    );

    // Act: Call the get method on DioClient
    final brasileiraoService = BrasileiraoService(client);
    final standings = await brasileiraoService.getBrasileiraoStandings();

    // Assert: Verify that the result matches the mocked response
    expect(standings.length, 20);
  });
}
