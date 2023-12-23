import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shipment_delivery/features/deliveries/domain/entities/DeliveryEntity.dart';
import 'package:shipment_delivery/features/deliveries/domain/usecases/deliveries_usecases.dart';

part 'deliveries_state.dart';

class DeliveriesCubit extends Cubit<DeliveriesState> {
  DeliveriesCubit({required DeliveriesUseCase getDeliveries})
      : _getDeliveries = getDeliveries,
        super(const DeliveriesInitial());

  final DeliveriesUseCase _getDeliveries;

  Future<void> getDeliveries({required String token}) async {
    emit(const GettingDeliveries());

    final result = await _getDeliveries(token);

    result.fold((failure) => emit(GetDeliveriesError(failure.message)),
        (deliveries) => emit(DeliveriesLoaded(deliveries)));
  }
}
