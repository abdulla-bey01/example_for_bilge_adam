import 'package:example_app_for_bilgeadam/data/repositories/bases/base_user_repository.dart';
import 'package:example_app_for_bilgeadam/data/repositories/remote/json_server_api/base/base_json_place_holder_repository.dart';

abstract class BaseJsonPlaceHolderUserRepository
    extends BaseJsonPlaceHolderRepository implements BaseUserRepository {}
