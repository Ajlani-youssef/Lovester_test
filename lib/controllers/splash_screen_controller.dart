class SplashScreenController {
  static void waitAndNavigate() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        print("hi");
      },
    );
  }
}
