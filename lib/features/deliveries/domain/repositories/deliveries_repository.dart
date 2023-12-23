import 'package:shipment_delivery/core/utils/typedef.dart';
import 'package:shipment_delivery/features/deliveries/domain/entities/DeliveryEntity.dart';

/// DeliveriesRepository is an abstract class defining the contract for operations
/// related to data within the domain layer.
/// Concrete implementations of this repository interface will be provided
/// in the data layer to interact with specific data sources (e.g., API, database).
abstract class DeliveriesRepository {
  const DeliveriesRepository();

  ResultFuture<List<DeliveryEntity>> getDeliveries({required String token});
}
