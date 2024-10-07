import 'package:brasileirao_app/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeSwicther extends StatelessWidget {
  final ThemeController themeController;
  final bool borderVisible;
  final Color iconColor;

  const ThemeSwicther({
    super.key,
    required this.themeController,
    this.borderVisible = true,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Obx(
        () => Icon(
          themeController.currentTheme == ThemeMode.light
              ? Icons.light_mode
              : Icons.dark_mode,
          color: iconColor,
        ),
      ),
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: borderVisible
                ? BorderSide(color: iconColor, width: 1.0)
                : BorderSide.none,
          ),
        ),
      ),
      onPressed: themeController.toggleThemeMode,
    );
  }
}
