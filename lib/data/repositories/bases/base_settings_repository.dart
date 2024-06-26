import 'package:example_app_for_bilgeadam/shared/enums/theme_mode.dart';
import 'package:flutter/foundation.dart';

abstract class BaseSettingsRepository {
  @protected
  Future<ThemeMode> getThemeMode();
  Future<void> updateThemeMode(ThemeMode themeMode);
  Future<ThemeMode> get themeMode => getThemeMode();
}
