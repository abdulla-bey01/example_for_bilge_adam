import 'package:example_app_for_bilgeadam/data/repositories/bases/base_settings_repository.dart';
import 'package:example_app_for_bilgeadam/shared/enums/theme_mode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as ui_theme;
import 'package:get/instance_manager.dart';

class SettingsService with ChangeNotifier {
  late ui_theme.ThemeMode _themeMode;
  ui_theme.ThemeMode get themeMode => _themeMode;

  Future<void> uploadSettings() async {
    _themeMode = await _getThemeMode();
    notifyListeners();
  }

  Future<ui_theme.ThemeMode> _getThemeMode() async {
    final settingsRepository = Get.find<BaseSettingsRepository>();
    final themeMode = await settingsRepository.themeMode;
    final themeModeOnUi = themeMode == ThemeMode.light
        ? ui_theme.ThemeMode.light
        : themeMode == ThemeMode.dark
            ? ui_theme.ThemeMode.dark
            : ui_theme.ThemeMode.system;
    return themeModeOnUi;
  }

  Future<void> updateThemeMode(ui_theme.ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;
    if (newThemeMode == _themeMode) return;
    _themeMode = newThemeMode;

    notifyListeners();
    final settingsRepository = Get.find<BaseSettingsRepository>();
    final themeModeOnData = newThemeMode == ui_theme.ThemeMode.light
        ? ThemeMode.light
        : newThemeMode == ui_theme.ThemeMode.dark
            ? ThemeMode.dark
            : ThemeMode.system;

    await settingsRepository.updateThemeMode(themeModeOnData);
  }
}
