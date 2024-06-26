import 'package:example_app_for_bilgeadam/app/di/configure_dependencies.dart';
import 'package:example_app_for_bilgeadam/app/services/settings_service.dart';
import 'package:example_app_for_bilgeadam/start/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  final settingService = SettingsService();
  await settingService.uploadSettings();
  runApp(const MyApp());
}
