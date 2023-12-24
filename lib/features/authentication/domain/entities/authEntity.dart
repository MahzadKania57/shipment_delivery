import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  const AuthEntity({required this.token});

  final String token;

  @override
  // TODO: implement props
  List<Object?> get props => [token];
}
