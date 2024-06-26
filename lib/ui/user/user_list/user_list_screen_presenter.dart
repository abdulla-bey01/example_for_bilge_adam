import 'package:example_app_for_bilgeadam/app/models/user_model.dart';
import 'package:example_app_for_bilgeadam/app/services/user_service.dart';
import 'package:example_app_for_bilgeadam/shared/enums/request_state.dart';
import 'package:get/get.dart';

class UserListScreenPresenter extends RxController {
  late RxList<UserModel> _users;
  List<UserModel> get users => _users;

  final Rx<RequestState> _getUsersRequestState = RequestState.default_.obs;
  RequestState get getUsersRequestState => _getUsersRequestState.value;

  void _getUsers() async {
    try {
      UserService userService = UserService();
      _getUsersRequestState.value = RequestState.processing;
      final users = await userService.getAllUsers();
      _users = users.obs;
      _getUsersRequestState.value = RequestState.successfully;
    } catch (e) {
      _getUsersRequestState.value = RequestState.unsucessfully;
    } finally {
      _getUsersRequestState.refresh();
    }
  }

  

  UserListScreenPresenter() {
    _getUsers();
  }
}
