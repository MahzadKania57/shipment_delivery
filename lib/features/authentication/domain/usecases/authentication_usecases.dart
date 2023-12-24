import 'package:shipment_delivery/core/utils/typedef.dart';
import 'package:shipment_delivery/features/authentication/domain/entities/authEntity.dart';
import 'package:shipment_delivery/features/authentication/domain/repositories/authentication_repository.dart';

/// use case is a class responsible for encapsulating a specific piece of business logic or
/// a particular operation that your application needs to perform.
/// It acts as a bridge between the presentation
/// layer and the data layer.
class AuthenticationUseCase {
  final AuthenticationRepository authenticationRepository;
  AuthenticationUseCase(this.authenticationRepository);

  ResultFuture<AuthEntity> call(String email, String password) async =>
      authenticationRepository.login(email: email, password: password);
}
