import 'package:example_app_for_bilgeadam/app/models/user_details_model.dart';
import 'package:example_app_for_bilgeadam/app/services/user_service.dart';
import 'package:example_app_for_bilgeadam/shared/enums/request_state.dart';
import 'package:get/get.dart';

class UserDetailsScreenPresenter extends RxController {
  late final Rx<UserDetailsModel> _userDetails;
  UserDetailsModel get userDetails => _userDetails.value;

  final Rx<RequestState> _getUserDetailsRequestState =
      RequestState.default_.obs;
  RequestState get getUserDetailsRequestState =>
      _getUserDetailsRequestState.value;

  void getDetails(dynamic id) async {
    try {
      UserService userService = UserService();
      _getUserDetailsRequestState.value = RequestState.processing;
      final userDetails = await userService.getUserDetails(id);
      _userDetails = userDetails.obs;
      _getUserDetailsRequestState.value = RequestState.successfully;
    } catch (e) {
      _getUserDetailsRequestState.value = RequestState.unsucessfully;
    } finally {
      _getUserDetailsRequestState.refresh();
    }
  }
}
