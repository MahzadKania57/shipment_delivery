import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipment_delivery/features/deliveries/presentation/cubit/deliveries_cubit.dart';
import 'package:shipment_delivery/features/deliveries/presentation/views/delivery_item.dart';

class Deliveries extends StatefulWidget {
  final String token;
  const Deliveries({super.key, required this.token});

  @override
  State<Deliveries> createState() => _DeliveriesState();
}

class _DeliveriesState extends State<Deliveries> {
  void getDeliveries() {
    context.read<DeliveriesCubit>().getDeliveries(token: widget.token);
  }

  Future<void> _refresh() async {
    // Simulate a delay for the data to refresh
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      getDeliveries();
    });
  }

  @override
  void initState() {
    super.initState();

    getDeliveries();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeliveriesCubit, DeliveriesState>(
        listener: (context, state) {
      if (state is GetDeliveriesError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.message),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
        ));
      }
    }, builder: (context, state) {
      return Scaffold(
          body: state is GettingDeliveries
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state is DeliveriesLoaded
                  ? Center(
                      child: ListView.builder(
                        itemCount: state.deliveries.length,
                        itemBuilder: (context, index) {
                          final delivery = state.deliveries[index];
                          return DeliveryItem(delivery: delivery);
                        },
                      ),
                    )
                  : Center(
                      child: IconButton(
                        icon: const Icon(
                          Icons.refresh,
                          color: Colors.red,
                        ),
                        onPressed: _refresh,
                      ),
                    ));
    });
  }
}
