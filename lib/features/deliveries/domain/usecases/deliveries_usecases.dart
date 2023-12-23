import 'package:shipment_delivery/core/errors/utils/typedef.dart';
import 'package:shipment_delivery/features/deliveries/domain/entities/DeliveryEntity.dart';
import 'package:shipment_delivery/features/deliveries/domain/repositories/deliveries_repository.dart';

/// use case is a class responsible for encapsulating a specific piece of business logic or
/// a particular operation that your application needs to perform.
/// It acts as a bridge between the presentation
/// layer and the data layer.
class DeliveriesUseCase {
  const DeliveriesUseCase(this.deliveriesRepository);

  final DeliveriesRepository deliveriesRepository;

  ResultFuture<List<DeliveryEntity>> call(String token) async =>
      deliveriesRepository.getDeliveries(token: token);
}
