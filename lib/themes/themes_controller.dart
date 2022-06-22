import 'package:flutter/material.dart';

class ThemesController with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;
  get themeMode => _themeMode;

  toogleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
