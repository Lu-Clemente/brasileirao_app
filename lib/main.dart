import 'package:brasileirao_app/controllers/is_dev_env.dart';
import 'package:brasileirao_app/controllers/theme_controller.dart';
import 'package:brasileirao_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

void main() async {
  // Ensure that WidgetsBinding is initialized before calling runApp
  WidgetsFlutterBinding.ensureInitialized();

  // Load the .env file
  await dotenv.load(fileName: ".env");

  // Initialize ThemeController and load the saved theme mode
  ThemeController themeController = Get.put(ThemeController());
  await themeController.loadThemeMode();

  // Run the app
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    return Obx(() => GetMaterialApp(
          title: 'Brasileirão App',
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            primarySwatch: Colors.grey,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            brightness: Brightness.dark,
            dividerColor: Colors.black45,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.deepOrange[400],
                  backgroundColor: Colors.deepOrange[400]),
            ),
          ),
          themeMode: themeController.currentTheme,
          home: HomeScreen(),
          debugShowCheckedModeBanner: !isDevEnv(),
        ));
  }
}
