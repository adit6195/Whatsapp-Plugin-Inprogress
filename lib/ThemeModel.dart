import 'package:flutter/cupertino.dart';
import 'package:whatsappplugin_in_progress/theme_shared_preference.dart';

class ThemeModel extends ChangeNotifier {
  late bool _isDark;
  late ThemeSharedPreference themeSharedPreference;
  bool get isDark => _isDark;

  ThemeModel() {
    _isDark = false;
    themeSharedPreference = ThemeSharedPreference();
    getThemePreferences();
  }

  set isDark(bool value) {
    _isDark = value;
    themeSharedPreference.setTheme(value);
    notifyListeners();
  }

  getThemePreferences() async {
    _isDark = await themeSharedPreference.getTheme();
    notifyListeners();
  }
}
