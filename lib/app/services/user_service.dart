import 'package:example_app_for_bilgeadam/app/models/user_details_model.dart';
import 'package:example_app_for_bilgeadam/app/models/user_model.dart';
import 'package:example_app_for_bilgeadam/data/repositories/bases/base_user_repository.dart';
import 'package:get/get.dart';

class UserService {
  Future<List<UserModel>> getAllUsers() async {
    final userRepository = Get.find<BaseUserRepository>();
    final users = await userRepository.getAll();
    return users
        .map((u) => UserModel(id: u.id, name: u.name, username: u.username))
        .toList();
  }

  Future<UserDetailsModel> getUserDetails(dynamic id) async {
    final userRepository = Get.find<BaseUserRepository>();
    final user = await userRepository.getById(id);
    return UserDetailsModel(
      id: user.id,
      name: user.name,
      email: user.email,
      username: user.username,
      phone: user.phone,
    );
  }
}
