import 'package:evently_app/UI/auth/forget_password_screen.dart';
import 'package:evently_app/UI/auth/login_screen/login_screen.dart';
import 'package:evently_app/UI/auth/regester_screen/regester_screen.dart';
import 'package:evently_app/UI/onBoarding/on_boarding_screen.dart';
import 'package:evently_app/UI/personalization_screen.dart';
import 'package:evently_app/core/common/app_theme.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        PersonalizationScreen.routeName: (context) =>
            const PersonalizationScreen(),
        OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegesterScreen.routeName: (context) => const RegesterScreen(),
        ForgetPasswordScreen.routeName: (context) =>
            const ForgetPasswordScreen(),
      },
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: context.watch<ThemeProvider>().themeMode,
      initialRoute: PersonalizationScreen.routeName,
    );
  }
}
