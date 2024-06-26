import 'package:example_app_for_bilgeadam/ui/settings/settings_screen.dart';
import 'package:example_app_for_bilgeadam/ui/user/user_details/user_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:example_app_for_bilgeadam/main.dart' as app_main;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Test of list and details screen', () {
    testWidgets('Go to settings', (tester) async {
      app_main.main();
      await tester.pumpAndSettle();
      final settingsButton = find.byType(IconButton);
      await tester.tap(settingsButton);
      await tester.pumpAndSettle();
      expect(find.byType(SettingsScreen), findsOneWidget);
    });

    testWidgets('Go to details', (tester) async {
      app_main.main();
      await tester.pumpAndSettle();
      final userListElement = find.byType(ListTile).at(0);
      await tester.tap(userListElement);
      await tester.pumpAndSettle();
      expect(find.byType(UserDetailsScreen), findsOneWidget);
    });
  });
}
