import 'package:flutter/material.dart';

class DeliveryItem extends StatelessWidget {
  String? name;
  bool? isCod;
  String? mobile;
  String? city;
  String? region;
  String? address;

  DeliveryItem(
      {super.key,
      this.name,
      this.isCod,
      this.mobile,
      this.city,
      this.region,
      this.address});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
