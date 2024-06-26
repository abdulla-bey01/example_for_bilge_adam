import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

abstract class BaseJsonPlaceHolderRepository {
  final Client _client = Client();
  Client get client => _client;
  @protected
  final String _baseUrl = 'jsonplaceholder.typicode.com';
  String get baseUrl => _baseUrl;
}
