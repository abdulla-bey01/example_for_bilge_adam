import 'package:example_app_for_bilgeadam/shared/enums/request_state.dart';
import 'package:example_app_for_bilgeadam/ui/settings/settings_screen.dart';
import 'package:example_app_for_bilgeadam/ui/user/user_details/user_details_screen.dart';
import 'package:example_app_for_bilgeadam/ui/user/user_list/user_list_screen_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});
  static const route = 'userlist';

  @override
  Widget build(BuildContext context) {
    final UserListScreenPresenter userListScreenPresenter =
        UserListScreenPresenter();
    final translations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(translations.userList),
        actions: [
          IconButton(onPressed: _goSettings, icon: const Icon(Icons.settings)),
        ],
      ),
      body: Obx(() {
        if (userListScreenPresenter.getUsersRequestState ==
                RequestState.processing ||
            userListScreenPresenter.getUsersRequestState ==
                RequestState.default_) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (userListScreenPresenter.getUsersRequestState ==
            RequestState.unsucessfully) {
          return Center(child: Text(translations.usersCannotBeFetched));
        }
        //
        final users = userListScreenPresenter.users;
        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              title: Text(user.name),
              subtitle: Text(user.username),
              onTap: () => _goUserDetails(user.id),
            );
          },
        );
      }),
    );
  }

  void _goUserDetails(dynamic id) {
    Get.toNamed(UserDetailsScreen.route, arguments: id);
  }

  void _goSettings() {
    Get.toNamed(SettingsScreen.route);
  }
}
