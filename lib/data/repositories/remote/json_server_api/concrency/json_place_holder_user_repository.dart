import 'dart:convert';
import 'package:example_app_for_bilgeadam/data/dtos/user_dto.dart';
import 'package:example_app_for_bilgeadam/data/repositories/remote/json_server_api/base/base_user_json_place_holder_repository.dart';

class JsonServerUserRepository extends BaseJsonPlaceHolderUserRepository {
  @override
  Future<List<UserDto>> getAll() async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: 'users',
    );
    // just to simulate fake delay
    await Future.delayed(const Duration(milliseconds: 500));
    //
    final result = await client.get(uri);
    final usersList = json.decode(result.body) as List;
    final users = <UserDto>[];
    for (int i = 0; i < usersList.length; i++) {
      final user = UserDto.fromMap(usersList[i]);
      users.add(user);
    }
    return users;
  }

  @override
  Future<UserDto> getById(dynamic id) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: 'users/$id',
    );
    // just to simulate fake delay
    await Future.delayed(const Duration(milliseconds: 500));
    //
    final result = await client.get(uri);
    final userMap = json.decode(result.body);
    final user = UserDto.fromMap(userMap);
    return user;
  }
}
