import 'package:brasileirao_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroButton extends StatelessWidget {
  const IntroButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.offAll(() => const HomeScreen());
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 25, 114, 27),
        elevation: 8,
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 10,
        ),
      ),
      child: const Text(
        'Confira!',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
