part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class LogInEvent extends AuthEvent {
  final String email;
  final String password;

  const LogInEvent({required this.email, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}
