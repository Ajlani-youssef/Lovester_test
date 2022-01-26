import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../controllers/splash_screen_controller.dart';

import '../config.dart';

class SplashScreen extends StatelessWidget {
  final SplashScreenController controller = SplashScreenController();

  SplashScreen({Key? key}) : super(key: key) {
    SplashScreenController.waitAndNavigate();
  }

  @override
  Widget build(BuildContext context) {
    double defaultHeight = MediaQuery.of(context).size.height * 0.024;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              mainColorLight,
              mainColor,
            ],
            center: Alignment(-0.75, -0.75),
            radius: 1.5,
            stops: [0.2, 0.8],
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: defaultHeight * 5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Image(
                image: AssetImage('assets/images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: 10,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.all(Radius.elliptical(100, 50)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(0.0, 0.0),
                    spreadRadius: -2,
                    blurRadius: 15,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: defaultHeight,
            ),
            const Text(
              "Welcome to",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: defaultHeight,
            ),
            const Text(
              "LOVESTER",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: defaultHeight * 5,
            ),
            SpinKitFadingCircle(
              color: Colors.grey.withOpacity(0.5),
              size: MediaQuery.of(context).size.width * 0.2,
            )
          ],
        ),
      ),
    );
  }
}
