import 'package:flutter/material.dart';
import 'package:providertemplate/services/service.locator.dart';
import 'package:providertemplate/ui/views/chicken_screen.dart';

void main() {
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chicken Screen',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: ChickenScreen(),
    );
  }
}
