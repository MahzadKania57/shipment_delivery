import 'package:dartz/dartz.dart';
import 'package:shipment_delivery/core/errors/failure.dart';
import 'package:shipment_delivery/core/errors/utils/typedef.dart';
import 'package:shipment_delivery/features/deliveries/domain/entities/DeliveryEntity.dart';
import 'package:shipment_delivery/features/deliveries/domain/repositories/deliveries_repository.dart';
import 'package:shipment_delivery/features/deliveries/data/data_sources/deliveries_data_source.dart';

/// DeliveriesRepositoryImpl is the concrete implementation of the DeliveriesRepository
/// interface.
/// This class implements the methods defined in DeliveriesRepository to interact
/// with data. It acts as a bridge between the domain layer
/// (use cases) and the data layer (data sources).
class DeliveriesRepositoryImpl implements DeliveriesRepository {
  final DeliveriesDataSource deliveriesDataSource;
  DeliveriesRepositoryImpl(this.deliveriesDataSource);

  @override
  ResultFuture<List<DeliveryEntity>> getDeliveries({required token}) async {
    final result = await deliveriesDataSource.getDeliveries(token: token);
    return Right(result);
  }
}
