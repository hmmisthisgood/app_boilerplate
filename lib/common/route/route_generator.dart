import 'package:boilerplate/feature/authentication/ui/screen/sign_in_screen.dart';
import 'package:boilerplate/feature/authentication/ui/screen/sign_up_screen.dart';
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
      case Routes.signIn:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case Routes.signup:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      default:
        return MaterialPageRoute(builder: (_) => SplashPage());
    }
  }
}
