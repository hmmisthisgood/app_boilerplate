import 'package:flutter/material.dart';
import 'package:boilerplate/common/route/routes.dart';
import 'package:boilerplate/feature/onboard/ui/screen/onboard_page.dart';
import 'package:boilerplate/feature/onboard/ui/screen/splash_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardPage());
      default:
        return MaterialPageRoute(builder: (_) => SplashPage());
    }
  }
}
