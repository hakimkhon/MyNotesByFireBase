import 'package:flutter/material.dart';
import 'package:mynotesfire/screens/auth/signup_screen.dart';
import 'package:mynotesfire/screens/home/home_screen.dart';
import 'package:mynotesfire/screens/auth/login_screen.dart';

class AppRoutesNames {
  static const String home = '/home';
  static const String signup = '/signup';
  static const String login = '/login';
}

class AppRoutes {
  static final AppRoutes _instance = AppRoutes._init();
  static AppRoutes get instance => _instance;
  AppRoutes._init();

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesNames.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case AppRoutesNames.signup:
        return MaterialPageRoute(builder: (context) => const AuthScreen());
      case AppRoutesNames.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
    }
  }
}
