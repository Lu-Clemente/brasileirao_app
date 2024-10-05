import 'package:brasileirao_app/models/standing.dart';
import 'package:brasileirao_app/repositories/standings_repository.dart';
import 'package:brasileirao_app/services/brasileirao_service.dart';
import 'package:brasileirao_app/services/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late StandingsRepository _standingsRepository;

  // Use RxList for storing standings reactively
  var standings = <Standing>[].obs;
  var isLoading = true.obs;

  HomeController() {
    final brasileiraoService = BrasileiraoService(
      DioClient(
        dio: Dio(),
      ),
    );
    _standingsRepository = StandingsRepository(brasileiraoService);

    // Fetch the standings when the controller is initialized
    fetchStandings();
  }

  // Fetch standings from the repository and store them in the observable list
  Future<void> fetchStandings() async {
    try {
      isLoading.value = true;
      final standingsList = await _standingsRepository.getStandings();
      standings.assignAll(standingsList);
    } catch (e) {
      print('Error fetching standings: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
