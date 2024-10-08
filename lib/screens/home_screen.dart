import 'package:brasileirao_app/controllers/rounds_controller.dart';
import 'package:brasileirao_app/controllers/theme_controller.dart';
import 'package:brasileirao_app/widgets/AppBar/custom_app_bar.dart';
import 'package:brasileirao_app/widgets/Buttons/theme_switcher.dart';
import 'package:brasileirao_app/widgets/Lists/rounds_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final roundsController = Get.put(RoundsController());
  late final themeController = Get.find<ThemeController>();

  final ScrollController _scrollController = ScrollController();
  double _appBarHeight = 340.0; // Default app bar height

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    setState(() {
      // Adjust the height based on scroll offset, but don't let it go below 120.0
      _appBarHeight = (340.0 - _scrollController.offset).clamp(120.0, 340.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    String getBannerImage() {
      if (_appBarHeight > 280) {
        return 'assets/images/banner.png';
      } else {
        if (themeController.themeMode.value == ThemeMode.dark) {
          return 'assets/images/banner-dark.png';
        } else {
          return 'assets/images/banner-light.png';
        }
      }
    }

    Color getIconColor() {
      if (_appBarHeight > 280) {
        return Colors.white;
      } else {
        if (themeController.themeMode.value == ThemeMode.dark) {
          return const Color(0xFFffd706);
        } else {
          return Colors.white;
        }
      }
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        preferredSize: Size.fromHeight(_appBarHeight),
        backgroundImage: getBannerImage(),
        actions: [
          ThemeSwicther(
            themeController: themeController,
            borderVisible: _appBarHeight > 280,
            iconColor: getIconColor(),
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
                  scrollController: _scrollController,
                  roundsController: roundsController,
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
