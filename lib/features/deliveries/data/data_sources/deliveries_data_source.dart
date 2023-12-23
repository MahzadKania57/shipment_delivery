import 'dart:convert';
import 'dart:html';

import 'package:shipment_delivery/core/errors/utils/constants.dart';
import 'package:shipment_delivery/features/deliveries/data/models/delivery_model.dart';
import 'package:http/http.dart' as http;

abstract class DeliveriesDataSource {
  Future<List<DeliveryModel>> getDeliveries({required token});
}

const getConsignmentsEndpoint = '/api/v1/consignments';

class DeliveriesDataSourceImpl implements DeliveriesDataSource {
  final http.Client client;

  const DeliveriesDataSourceImpl(this.client);

  @override
  Future<List<DeliveryModel>> getDeliveries({required token}) async {
    final response = await client.get(
      Uri.http(baseUrl, getConsignmentsEndpoint),
      headers: {
        "Authorization": token,
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
    );

    return List<Map<String, dynamic>>.from(jsonDecode(response.body) as List)
        .map((delivery) => DeliveryModel.fromMap(delivery))
        .toList();
  }
}
