import 'package:brasileirao_app/controllers/app_bar_controller.dart';
import 'package:brasileirao_app/controllers/rounds_controller.dart';
import 'package:brasileirao_app/controllers/theme_controller.dart';
import 'package:brasileirao_app/widgets/AppBar/custom_app_bar.dart';
import 'package:brasileirao_app/widgets/Buttons/theme_switcher.dart';
import 'package:brasileirao_app/widgets/Lists/rounds_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final roundsController = Get.put(RoundsController());
    final themeController = Get.find<ThemeController>();
    final appBarController = Get.put(AppBarController());

    String getBannerImage(double appBarHeight) {
      if (appBarHeight > 280) {
        return 'assets/images/banner.png';
      } else {
        if (themeController.themeMode.value == ThemeMode.dark) {
          return 'assets/images/banner-dark.png';
        } else {
          return 'assets/images/banner-light.png';
        }
      }
    }

    Color getIconColor(double appBarHeight) {
      if (appBarHeight > 280) {
        return Colors.white;
      } else {
        if (themeController.themeMode.value == ThemeMode.dark) {
          return const Color(0xFFffd706);
        } else {
          return Colors.white;
        }
      }
    }

    return Obx(() {
      final appBarHeight = appBarController.appBarHeight.value;
      return Scaffold(
        appBar: CustomAppBar(
          title: '',
          preferredSize: Size.fromHeight(appBarHeight),
          backgroundImage: getBannerImage(appBarHeight),
          actions: [
            ThemeSwicther(
              themeController: themeController,
              borderVisible: appBarHeight > 280,
              iconColor: getIconColor(appBarHeight),
            )
          ],
        ),
        body: Obx(() {
          if (roundsController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (roundsController.rounds.isEmpty) {
            return const Center(child: Text('Nenhuma rodada encontrada'));
          } else {
            return Column(
              children: [
                Expanded(
                  child: RoundsList(
                    scrollController: appBarController
                        .scrollController, // Use the controller's scroll controller
                    roundsController: roundsController,
                  ),
                ),
              ],
            );
          }
        }),
      );
    });
  }
}
