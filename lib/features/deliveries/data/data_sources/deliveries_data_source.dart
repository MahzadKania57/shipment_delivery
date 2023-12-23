import 'dart:convert';
import 'package:shipment_delivery/core/errors/exceptions.dart';
import 'package:shipment_delivery/core/utils/constants.dart';
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
    try {
      final response = await client.get(
        Uri.http(baseUrl, getConsignmentsEndpoint),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
      );
      if (response.statusCode != 200) {
        throw APIException(
            message: jsonDecode(response.body)['message'],
            statusCode: response.statusCode);
      }

      // print(response.statusCode);
      // print(jsonDecode(response.body)['data']);
      return List<Map<String, dynamic>>.from(
              jsonDecode(response.body)['data'] as List)
          .map((delivery) => DeliveryModel.fromMap(delivery))
          .toList();
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }
}
