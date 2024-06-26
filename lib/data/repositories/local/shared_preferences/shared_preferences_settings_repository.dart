import 'package:example_app_for_bilgeadam/data/repositories/bases/base_settings_repository.dart';
import 'package:example_app_for_bilgeadam/shared/enums/theme_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesSettingsRepository extends BaseSettingsRepository {
  String themModeKey = 'themeMode';

  @override
  Future<ThemeMode> getThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final themeModeResult = prefs.getInt(themModeKey);
    return themeModeResult != null
        ? ThemeMode.values.firstWhere((x) => x.index == themeModeResult)
        : ThemeMode.system;
  }

  @override
  Future<void> updateThemeMode(ThemeMode themeMode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(themModeKey, themeMode.index);
  }
}
