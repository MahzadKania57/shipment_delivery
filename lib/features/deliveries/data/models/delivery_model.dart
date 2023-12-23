import 'dart:convert';

import 'package:shipment_delivery/features/deliveries/domain/entities/DeliveryEntity.dart';

class DeliveryModel extends DeliveryEntity {
  const DeliveryModel(
      {required super.id,
      required super.isCod,
      required super.receiverName,
      required super.receiverPhone,
      required super.city,
      required super.region,
      required super.address});

  const DeliveryModel.empty()
      : this(
            id: 1,
            isCod: true,
            receiverName: "علی محمدی",
            receiverPhone: '09143657654',
            city: 'تهران',
            region: 'دکتر هوشیار',
            address: 'کوچه عباسی، پلاک 23');

  factory DeliveryModel.fromJson(String source) =>
      DeliveryModel.fromMap(jsonDecode(source) as Map<String, dynamic>);

  DeliveryModel.fromMap(Map<String, dynamic> map)
      : this(
            id: map['id'] as int,
            isCod: map['is_cod'] as bool,
            receiverName: map['receiver']['full_name'] as String,
            receiverPhone: map['receiver']['mobile'] as String,
            city: map['receiver_address']['city'] as String,
            region: map['receiver_address']['region'] as String,
            address: map['receiver_address']['full_address'] as String);
}
