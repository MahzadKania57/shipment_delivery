import 'package:equatable/equatable.dart';

class DeliveryEntity extends Equatable {
  const DeliveryEntity(
      {required this.id,
      required this.isCod,
      required this.receiverName,
      required this.receiverPhone,
      required this.city,
      required this.region,
      required this.address});

  const DeliveryEntity.empty()
      : this(
            id: 1,
            isCod: true,
            receiverName: "علی محمدی",
            receiverPhone: '09143657654',
            city: 'تهران',
            region: 'دکتر هوشیار',
            address: 'کوچه عباسی، پلاک 23');

  final int id;
  final bool isCod;
  final String receiverName;
  final String receiverPhone;
  final String city;
  final String region;
  final String address;

  @override
  List<Object?> get props =>
      [id, isCod, receiverName, receiverPhone, city, region, address];
}
