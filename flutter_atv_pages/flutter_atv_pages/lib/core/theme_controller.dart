import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends ChangeNotifier {
  static const _k = 'dark_mode';
  bool _isDark = false;
  bool get isDark => _isDark;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _isDark = prefs.getBool(_k) ?? false;
    notifyListeners();
  }

  Future<void> toggle() async {
    _isDark = !_isDark;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_k, _isDark);
  }
}
