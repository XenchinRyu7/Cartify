import 'package:flutter/material.dart';

import 'splash_screen.dart';
import 'sign_in_screen.dart';
import 'sign_up_screen.dart';

/// Authentication router for handling auth-related navigation
class AuthRouter {
  static const String splash = '/splash';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String main = '/main';

  /// Generate routes for authentication screens
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
      
      case signIn:
        return MaterialPageRoute(
          builder: (_) => const SignInScreen(),
          settings: settings,
        );
      
      case signUp:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
          settings: settings,
        );
      
      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
    }
  }

  /// Navigate to sign in screen
  static void navigateToSignIn(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      signIn,
      (route) => false,
    );
  }

  /// Navigate to sign up screen
  static void navigateToSignUp(BuildContext context) {
    Navigator.pushNamed(
      context,
      signUp,
    );
  }

  /// Navigate to main app
  static void navigateToMain(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      main,
      (route) => false,
    );
  }

  /// Navigate back to sign in
  static void navigateBackToSignIn(BuildContext context) {
    Navigator.pop(context);
  }
}
