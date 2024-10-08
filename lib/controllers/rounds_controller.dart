import 'package:brasileirao_app/models/competition_match_details.dart';
import 'package:brasileirao_app/models/round.dart';
import 'package:brasileirao_app/repositories/rounds_repository.dart';
import 'package:brasileirao_app/services/brasileirao_service.dart';
import 'package:brasileirao_app/services/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class RoundsController extends GetxController {
  late RoundsRepository _roundsRepository;

  // Use RxList for storing rounds and matches reactively
  var rounds = <Round>[].obs;
  var isLoading = true.obs;
  var matchesByRound = <CompetitionMatchDetails>[].obs;
  var currentRound = Round(
    roundNumber: 0,
    name: '',
    slug: '',
    status: RoundStatus.finished,
  ).obs;

  RoundsController() {
    final brasileiraoService = BrasileiraoService(
      DioClient(
        dio: Dio(),
      ),
    );
    _roundsRepository = RoundsRepository(brasileiraoService);

    // Fetch the standings when the controller is initialized
    fetchRounds();
  }

  // call for fetchRoundDetails when the currentRound changes
  @override
  void onInit() {
    ever(currentRound, (_) {
      fetchRoundDetails(currentRound.value.roundNumber);
    });
    super.onInit();
  }

  // Fetch standings from the repository and store them in the observable list
  Future<void> fetchRounds() async {
    try {
      isLoading.value = true;
      final roundsList = await _roundsRepository.getRounds();
      rounds.assignAll(roundsList);
    } catch (e) {
      print('Error fetching standings: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void setCurrentRound(Round round) {
    currentRound.value = round;
  }

  void previousRound() {
    final currentRoundIndex = rounds.indexWhere(
      (round) => round.roundNumber == currentRound.value.roundNumber,
    );
    if (currentRoundIndex > 0) {
      currentRound.value = rounds[currentRoundIndex - 1];
    }
  }

  void nextRound() {
    final currentRoundIndex = rounds.indexWhere(
      (round) => round.roundNumber == currentRound.value.roundNumber,
    );
    if (currentRoundIndex < rounds.length - 1) {
      currentRound.value = rounds[currentRoundIndex + 1];
    }
  }

  // Fetch matches from the repository and store them in the observable list
  Future<void> fetchRoundDetails(int roundNumber) async {
    try {
      isLoading.value = true;
      final roundDetails =
          await _roundsRepository.getRoundByNumber(roundNumber);
      matchesByRound.assignAll(roundDetails.matches);
    } catch (e) {
      print('Error fetching matches: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
