import 'package:example_app_for_bilgeadam/app/services/settings_service.dart';
import 'package:example_app_for_bilgeadam/data/repositories/bases/base_user_repository.dart';
import 'package:example_app_for_bilgeadam/data/repositories/bases/base_settings_repository.dart';
import 'package:example_app_for_bilgeadam/data/repositories/local/shared_preferences/shared_preferences_settings_repository.dart';
import 'package:example_app_for_bilgeadam/data/repositories/remote/json_server_api/concrency/json_place_holder_user_repository.dart';
import 'package:get/get.dart';

void configureDependencies() {
  //Repositories
  Get.put<BaseSettingsRepository>(SharedPreferencesSettingsRepository());
  Get.put<BaseUserRepository>(JsonServerUserRepository());
  //Services
  Get.put<SettingsService>(SettingsService()).uploadSettings();
}
