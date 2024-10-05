import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  Future<void> loadThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedTheme = prefs.getString('theme_mode');

    switch (savedTheme) {
      case 'light':
        themeMode.value = ThemeMode.light;
        break;
      case 'dark':
        themeMode.value = ThemeMode.dark;
        break;
      default:
        themeMode.value = ThemeMode.system;
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    themeMode.value = mode;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String modeString = mode == ThemeMode.light
        ? 'light'
        : mode == ThemeMode.dark
            ? 'dark'
            : 'system';
    await prefs.setString('theme_mode', modeString);
  }

  void toggleThemeMode() {
    if (themeMode.value == ThemeMode.light) {
      setThemeMode(ThemeMode.dark);
    } else if (themeMode.value == ThemeMode.dark) {
      setThemeMode(ThemeMode.light);
    }
  }

  ThemeMode get currentTheme => themeMode.value;
}
