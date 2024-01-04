import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  final lightBackgroundImage = 'assets/login_page/images/4758652_1473.jpg';
  final darkBackgroundImage = 'assets/login_page/images/4758651_1472.jpg';

  bool get isDarkMode => _isDarkMode;

  String get backgroundImage =>
      _isDarkMode ? darkBackgroundImage : lightBackgroundImage;

  ThemeData get themeData => _isDarkMode ? darkTheme : lightTheme;

  void toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = !_isDarkMode;
    prefs.setBool('isDarkMode', _isDarkMode);
    notifyListeners();
  }

  void loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }
}

final lightTheme = ThemeData(
  brightness: Brightness.light,

  // Add your light mode theme properties here
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  // Add your dark mode theme properties here
);