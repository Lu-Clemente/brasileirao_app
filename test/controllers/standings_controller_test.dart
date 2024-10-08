import 'package:brasileirao_app/controllers/standings_controller.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  test('StandingsController fetchStandings() should update the standings list',
      () async {
    // Create an instance of the StandingsController class
    final standingsController = StandingsController();

    // Call the fetchStandings() method
    await standingsController.fetchStandings();

    // Check if the standings list is not empty
    expect(standingsController.standings.isNotEmpty, true);
  });
}
