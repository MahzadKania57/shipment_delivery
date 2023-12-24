import 'package:flutter/material.dart';
import 'package:shipment_delivery/features/deliveries/domain/entities/DeliveryEntity.dart';

class DeliveryItem extends StatelessWidget {
  final DeliveryEntity delivery;

  const DeliveryItem({super.key, required this.delivery});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(delivery.id.toString()),
        Text(delivery.receiverName),
        Text("${delivery.city} ${delivery.region} ${delivery.address}"),
        Text(delivery.receiverPhone)
      ],
    );
  }
}
