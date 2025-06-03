import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String themeTitle = 'Light';

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
}
