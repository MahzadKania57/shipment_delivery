import 'dart:convert';

import 'package:shipment_delivery/core/errors/exceptions.dart';
import 'package:shipment_delivery/core/utils/constants.dart';
import 'package:shipment_delivery/features/authentication/data/models/authModel.dart';
import 'package:http/http.dart' as http;

abstract class AuthenticationDataSource {
  Future<AuthModel> login({required email, required password});
}

const loginEndpoint = '/api/v1/auth/login';

class AuthenticationDataSourceImpl implements AuthenticationDataSource {
  final http.Client client;

  const AuthenticationDataSourceImpl(this.client);

  @override
  Future<AuthModel> login({required email, required password}) async {
    try {
      final response = await client.post(Uri.http(baseUrl, loginEndpoint),
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json"
          },
          body: jsonEncode({'email': '$email', 'password': '$password'}));

      if (response.statusCode != 200) {
        throw APIException(
            message: jsonDecode(response.body)['message'],
            statusCode: response.statusCode);
      }

      print(response.statusCode);
      print(jsonDecode(response.body)['access_token']);
      return AuthModel.from(jsonDecode(response.body));
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }
}
