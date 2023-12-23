import 'package:flutter/material.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:shipment_delivery/core/services/injection_container.dart';
import 'package:shipment_delivery/features/deliveries/presentation/cubit/deliveries_cubit.dart';
import 'package:shipment_delivery/features/deliveries/presentation/views/deliveries_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DeliveriesCubit>(),
      child: MaterialApp(
          title: "Shipment Delivery",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              useMaterial3: true,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme: PersianFonts.vazirTextTheme),
          home: const Deliveries()),
    );
  }
}
