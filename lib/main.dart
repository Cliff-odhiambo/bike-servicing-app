import 'package:flutter/material.dart';
import 'screens/splash/splash_screen.dart';
import 'core/theme/app_theme.dart';
import 'features/authentication/login_screen.dart';
import 'core/routes/app_routes.dart';
import 'features/authentication/login_screen.dart';
import 'features/authentication/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CycleFix',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.register: (context) => const RegisterScreen(),
      },
    );
  }
}