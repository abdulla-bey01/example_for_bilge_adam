import 'package:example_app_for_bilgeadam/app/services/settings_service.dart';
import 'package:example_app_for_bilgeadam/ui/settings/settings_screen.dart';
import 'package:example_app_for_bilgeadam/ui/user/user_details/user_details_screen.dart';
import 'package:example_app_for_bilgeadam/ui/user/user_list/user_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final settingsService = Get.find<SettingsService>();
    return ListenableBuilder(
      listenable: settingsService,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsService.themeMode,
          initialRoute: UserListScreen.route,
          routes: {
            UserListScreen.route: (_) => const UserListScreen(),
            UserDetailsScreen.route: (_) => const UserDetailsScreen(),
            SettingsScreen.route: (_) => const SettingsScreen(),
          },
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsScreen.route:
                    return const SettingsScreen();
                  case UserListScreen.route:
                    return const UserListScreen();
                  case UserDetailsScreen.route:
                  default:
                    return const UserListScreen();
                }
              },
            );
          },
        );
      },
    );
  }
}
