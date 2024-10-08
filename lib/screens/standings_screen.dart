import 'package:brasileirao_app/controllers/standings_controller.dart';
import 'package:brasileirao_app/controllers/theme_controller.dart';
import 'package:brasileirao_app/widgets/AppBar/custom_app_bar.dart';
import 'package:brasileirao_app/widgets/Buttons/theme_switcher.dart';
import 'package:brasileirao_app/widgets/Lists/standings_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StandingsScreen extends StatelessWidget {
  StandingsScreen({super.key});

  late final standingsController = Get.put(StandingsController());
  late final themeController = Get.find<ThemeController>();

  String getBannerImage() {
    if (themeController.themeMode.value == ThemeMode.dark) {
      return 'assets/images/banner-dark.png';
    } else {
      return 'assets/images/banner-light.png';
    }
  }

  Color getIconColor() {
    if (themeController.themeMode.value == ThemeMode.dark) {
      return const Color(0xFFffd706);
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: CustomAppBar(
            title: '',
            backgroundImage: getBannerImage(),
            preferredSize: const Size.fromHeight(120),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: getIconColor(),
              ),
              onPressed: () {
                Get.back();
              },
            ),
            actions: [
              ThemeSwicther(
                themeController: themeController,
                iconColor: getIconColor(),
                borderVisible: false,
              )
            ],
          ),
          body: Obx(() {
            if (standingsController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (standingsController.standings.isEmpty) {
              return const Center(child: Text('Tabela indisponível'));
            } else {
              return Column(
                children: [
                  Expanded(
                    child: StandingsList(
                      standingsController: standingsController,
                    ),
                  ),
                ],
              );
            }
          }),
        ));
  }
}
