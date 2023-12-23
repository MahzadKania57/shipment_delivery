import 'package:flutter/material.dart';
import 'package:persian_fonts/persian_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shipment Delivery",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: PersianFonts.vazirTextTheme),
      home: const Scaffold(
        body: Center(
          child: Text('سلام دنیا'),
        ),
      ),
    );
  }
}
