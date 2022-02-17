import 'dart:convert';

import 'package:http/http.dart';

import '../error/exceptions.dart';
import 'api_constants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  Future<dynamic> get(String path) async {
    final url =
        Uri(scheme: ApiConstants.scheme, host: ApiConstants.host, path: path);
    try {
      final response = await _client.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw ServerException();
      }
    } catch (error) {
      throw ServerException();
    }
  }
}
