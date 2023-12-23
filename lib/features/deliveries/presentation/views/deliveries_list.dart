import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipment_delivery/features/deliveries/presentation/cubit/deliveries_cubit.dart';

class Deliveries extends StatefulWidget {
  const Deliveries({super.key});

  @override
  State<Deliveries> createState() => _DeliveriesState();
}

class _DeliveriesState extends State<Deliveries> {
  String token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vODIuMTE1LjI2LjE2NDo4MDgwL2FwaS92MS9hdXRoL2xvZ2luIiwiaWF0IjoxNzAzMzY3NTg5LCJleHAiOjE3MDMzNzExODksIm5iZiI6MTcwMzM2NzU4OSwianRpIjoiam9OQWVBcHV1Z3hiUGtKciIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.abOVu9sgeXZTosDOxG9RbNIbxm1rlFVSNIyrztZpLCc";
  void getDeliveries() {
    context.read<DeliveriesCubit>().getDeliveries(token: token);
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                10.0), // Adjust the border radius as needed
          ),
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
                          return Column(
                            children: [
                              Text(delivery.id.toString()),
                              Text(delivery.receiverName),
                              Text(
                                  "${delivery.city} ${delivery.region} ${delivery.address}"),
                              Text(delivery.receiverPhone)
                            ],
                          );
                        },
                      ),
                    )
                  : const Center(
                      child: Text('Something went wrong!'),
                    ));
    });
  }
}
