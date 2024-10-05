import 'package:brasileirao_app/controllers/home_controller.dart';
import 'package:brasileirao_app/widgets/shield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  late final homeController = Get.put(HomeController());

  HomeScreen({super.key});

  String getAssetImageById(String id) {
    return 'assets/images/id_$id.svg';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Brasileirão')),
      body: Obx(() {
        if (homeController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (homeController.standings.isEmpty) {
          return const Center(child: Text('Tabela indisponível'));
        } else {
          return ListView.builder(
            itemCount: homeController.standings.length,
            itemBuilder: (context, index) {
              final standing = homeController.standings[index];
              return ListTile(
                leading: Shield(
                  imageSrc: getAssetImageById(
                    standing.team.teamId.toString(),
                  ),
                  fit: BoxFit.contain,
                  isAsset: true,
                ),
                title: Text(standing.team.aka ?? ''),
                trailing: Text('Pts: ${standing.points}'),
              );
            },
          );
        }
      }),
    );
  }
}