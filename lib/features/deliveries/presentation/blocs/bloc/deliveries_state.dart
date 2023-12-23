part of 'deliveries_bloc.dart';

sealed class DeliveriesState extends Equatable {
  const DeliveriesState();

  @override
  List<Object> get props => [];
}

final class DeliveriesInitial extends DeliveriesState {
  const DeliveriesInitial();
}

class GettingDeliveries extends DeliveriesState {
  const GettingDeliveries();
}

class DeliveriesLoaded extends DeliveriesState {
  const DeliveriesLoaded(this.deliveries);

  final List<DeliveryEntity> deliveries;
}

class GetDeliveriesError extends DeliveriesState {
  const GetDeliveriesError(this.message);

  final String message;
}
