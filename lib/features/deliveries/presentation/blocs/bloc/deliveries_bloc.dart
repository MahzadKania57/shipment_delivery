import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shipment_delivery/features/deliveries/domain/entities/DeliveryEntity.dart';
import 'package:shipment_delivery/features/deliveries/domain/usecases/deliveries_usecases.dart';

part 'deliveries_event.dart';
part 'deliveries_state.dart';

class DeliveriesBloc extends Bloc<DeliveriesEvent, DeliveriesState> {
  DeliveriesBloc({required DeliveriesUseCase getDeliveries})
      : _getDeliveries = getDeliveries,
        super(const DeliveriesInitial()) {
    on<GetDeliveriesEvent>(_getDeliveriesHandler);
  }

  final DeliveriesUseCase _getDeliveries;

  Future<void> _getDeliveriesHandler(
    GetDeliveriesEvent event,
    Emitter<DeliveriesState> emit,
  ) async {
    emit(const GettingDeliveries());

    final result = await _getDeliveries(event.token);

    result.fold(
      (failure) => emit(GetDeliveriesError(failure.message)),
      (deliveries) => emit(DeliveriesLoaded(deliveries)),
    );
  }
}
