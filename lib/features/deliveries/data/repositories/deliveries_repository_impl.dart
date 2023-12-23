import 'package:dartz/dartz.dart';
import 'package:shipment_delivery/core/errors/exceptions.dart';
import 'package:shipment_delivery/core/errors/failure.dart';
import 'package:shipment_delivery/core/utils/typedef.dart';
import 'package:shipment_delivery/features/deliveries/domain/entities/DeliveryEntity.dart';
import 'package:shipment_delivery/features/deliveries/domain/repositories/deliveries_repository.dart';
import 'package:shipment_delivery/features/deliveries/data/data_sources/deliveries_data_source.dart';

class DeliveriesRepositoryImpl implements DeliveriesRepository {
  final DeliveriesDataSource deliveriesDataSource;
  DeliveriesRepositoryImpl(this.deliveriesDataSource);

  @override
  ResultFuture<List<DeliveryEntity>> getDeliveries({required token}) async {
    try {
      final result = await deliveriesDataSource.getDeliveries(token: token);
      return Right(result);
    } on APIException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}
