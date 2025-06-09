import 'package:flutter/material.dart';

class AppSettingsProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String themeTitle = 'Light';
  String language = 'en'; // Default language

  void toggleTheme() {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
      themeTitle = 'Dark';
    } else {
      themeMode = ThemeMode.light;
      themeTitle = 'Light';
    }
    notifyListeners();
  }

  void changeLaguage() {
    if (language == 'en') {
      language = 'ar';
    } else {
      language = 'en';
    }
    notifyListeners();
  }
}
