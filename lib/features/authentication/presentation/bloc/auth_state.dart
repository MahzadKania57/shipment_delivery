part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class SigningIn extends AuthState {
  const SigningIn();
}

class SignedIn extends AuthState {
  const SignedIn(this.auth);

  final AuthEntity auth;
}

class SignInError extends AuthState {
  const SignInError(this.message);

  final String message;
}
