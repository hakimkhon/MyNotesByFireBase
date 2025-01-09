import 'package:flutter/material.dart';
import 'package:mynotesfire/ui/screens/auth/signup_screen.dart';
import 'package:mynotesfire/ui/screens/home/home_screen.dart';
import 'package:mynotesfire/ui/screens/auth/login_screen.dart';
import 'package:mynotesfire/ui/screens/add_edit/add_notes_screen.dart';
import 'package:mynotesfire/ui/screens/slpash/splash_screen.dart';

class AppRoutesNames {
  static const String home = '/home';
  static const String signup = '/signup';
  static const String login = '/login';
  static const String splash = '/splash';
  static const String add = '/add';
}

class AppRoutes {
  static final AppRoutes _instance = AppRoutes._init();
  static AppRoutes get instance => _instance;
  AppRoutes._init();

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesNames.add:
        return MaterialPageRoute(builder: (context) => const AddNotesScreen());
      case AppRoutesNames.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
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
