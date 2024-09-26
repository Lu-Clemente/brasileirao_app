import 'package:flutter_test/flutter_test.dart';
import 'package:brasileirao_app/controllers/home_controller.dart';

void main() {
  // Test the HomeController class methods and properties using the test() function

  test('HomeController fetchStandings() should update the standings list',
      () async {
    // Create an instance of the HomeController class
    final homeController = HomeController();

    // Call the fetchStandings() method
    await homeController.fetchStandings();

    // Check if the standings list is not empty
    expect(homeController.standings.isNotEmpty, true);
  });
}
