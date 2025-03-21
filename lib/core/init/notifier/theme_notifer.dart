import 'package:flutter/material.dart';

import '../../constants/enums/theme_enums.dart';
import '../theme/app_theme.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppTheme.instance.theme;

  AppThemes _currenThemeEnum = AppThemes.LIGHT;

  /// Applicaton theme enum.
  /// Deafult value is [AppThemes.LIGHT]
  AppThemes get currenThemeEnum => _currenThemeEnum;

  ThemeData get currentTheme => _currentTheme;

  void changeValue(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      _currentTheme = AppTheme.instance.light;
    } else {
      _currentTheme = AppTheme.instance.dark;
    }
    notifyListeners();
  }

  /// Change your app theme with [currenThemeEnum] value.
  void changeTheme() {
    if (_currenThemeEnum == AppThemes.LIGHT) {
      _currentTheme = AppTheme.instance.dark;
      _currenThemeEnum = AppThemes.DARK;
      AppTheme.instance.theme = _currentTheme;
    } else {
      _currentTheme = AppTheme.instance.light;
      _currenThemeEnum = AppThemes.LIGHT;
      AppTheme.instance.theme = _currentTheme;
    }
    notifyListeners();
  }
}
