import 'package:shipment_delivery/features/authentication/domain/entities/authEntity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({required super.token});

  factory AuthModel.from(Map<String, dynamic> map) {
    return AuthModel(token: map['access_token'] as String);
  }

  // AuthModel.fromMap(Map<String, dynamic> map)
  //     : super(token: map['access_token'] as String);
}
