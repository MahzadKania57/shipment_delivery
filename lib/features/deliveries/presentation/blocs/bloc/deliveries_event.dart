part of 'deliveries_bloc.dart';

abstract class DeliveriesEvent extends Equatable {
  const DeliveriesEvent();

  @override
  List<Object> get props => [];
}

class GetDeliveriesEvent extends DeliveriesEvent {
  final String token;

  const GetDeliveriesEvent({required this.token});

  @override
  List<Object> get props => [token];
}
