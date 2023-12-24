import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shipment_delivery/features/authentication/domain/entities/authEntity.dart';
import 'package:shipment_delivery/features/authentication/domain/usecases/authentication_usecases.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthenticationUseCase signIn})
      : _signIn = signIn,
        super(AuthInitial()) {
    on<LogInEvent>(_signInHandler);
  }

  final AuthenticationUseCase _signIn;

  Future<void> _signInHandler(
    LogInEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _signIn(event.email, event.password);

    result.fold((failure) => emit(SignInError(failure.message)),
        (auth) => emit(SignedIn(auth)));
  }
}
