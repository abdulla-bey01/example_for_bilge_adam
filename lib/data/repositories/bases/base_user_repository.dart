import 'package:example_app_for_bilgeadam/data/dtos/user_dto.dart';

abstract class BaseUserRepository {
  Future<List<UserDto>> getAll();
  Future<UserDto> getById(dynamic id);
}
