import 'package:flutter/material.dart';
import '../config.dart';
import '../screens/home_screen.dart';

class SplashScreenController {
  static void waitAndNavigate() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(navigatorKey.currentContext!).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      },
    );
  }
}
