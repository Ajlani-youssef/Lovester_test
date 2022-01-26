import 'package:flutter/material.dart';
import '../config.dart';
import '../screens/home_screen.dart';

class SplashScreenController {
  static void waitAndNavigate() {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        Navigator.of(navigatorKey.currentContext!).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomeScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return ScaleTransition(
                scale: Tween<double>(
                  begin: 0.0,
                  end: 1.0,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
                child: child,
              );
            },
          ),
        );
      },
    );
  }
}
