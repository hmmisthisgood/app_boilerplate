import 'package:flutter/material.dart';
import 'package:galaxy4k/common/route/routes.dart';
import 'package:galaxy4k/feature/onboard/ui/screen/splash_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute(builder: (_) => SplashPage());
      default:
        return MaterialPageRoute(builder: (_) => SplashPage());
    }
  }
}
