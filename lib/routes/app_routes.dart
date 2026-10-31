import 'package:flutter/material.dart';

import '../presentation/pages/dashboard_page.dart';
import '../presentation/pages/forgot_password_page.dart';
import '../presentation/pages/login.dart';
import '../presentation/pages/profile_page.dart';
import '../presentation/pages/register.dart';
import '../presentation/pages/splash.dart';

abstract final class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const register = '/register';
  static const forgotPassword = '/forgot-password';
  static const dashboard = '/dashboard';
  static const profile = '/profile';

  static Map<String, WidgetBuilder> get routes => {
    splash: (context) => const SplashPage(),
    login: (context) => const LoginPage(),
    register: (context) => const RegisterPage(),
    forgotPassword: (context) => const ForgotPasswordPage(),
    dashboard: (context) => const DashboardPage(),
    profile: (context) => const ProfilePage(),
  };
}
