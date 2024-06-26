import 'package:example_app_for_bilgeadam/shared/enums/request_state.dart';
import 'package:example_app_for_bilgeadam/ui/user/user_details/user_details_screen_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});
  static const route = 'userdetails';

  @override
  Widget build(BuildContext context) {
    final userId = ModalRoute.of(context)?.settings.arguments;
    final UserDetailsScreenPresenter userDetailsScreenPresenter =
        UserDetailsScreenPresenter();
    userDetailsScreenPresenter.getDetails(userId);
    final translations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(translations.userDetails),
      ),
      body: Obx(
        () => userDetailsScreenPresenter.getUserDetailsRequestState ==
                    RequestState.default_ ||
                userDetailsScreenPresenter.getUserDetailsRequestState ==
                    RequestState.processing
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : userDetailsScreenPresenter.getUserDetailsRequestState ==
                    RequestState.unsucessfully
                ? Center(
                    child: Text(translations.detailsCanNotBeLoaded),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(translations
                            .name(userDetailsScreenPresenter.userDetails.name)),
                        Text(translations.username(
                            userDetailsScreenPresenter.userDetails.username)),
                        Text(translations.email(
                            userDetailsScreenPresenter.userDetails.email)),
                        Text(translations.phone(
                            userDetailsScreenPresenter.userDetails.phone)),
                      ],
                    ),
                  ),
      ),
    );
  }
}
