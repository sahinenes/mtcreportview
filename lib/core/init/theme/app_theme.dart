import 'package:flutter/material.dart';

import 'theme_data_dark.dart';
import 'theme_data_light.dart';

class AppTheme {
  AppTheme._init();
  static AppTheme? _instance;
  static AppTheme get instance {
    _instance ??= AppTheme._init();
    return _instance!;
  }

  ThemeData theme = themeLight;
  ThemeData light = themeLight;
  ThemeData dark = themeDark;
}
