import 'package:dokan_ecommerce/constants/theme.dart';
import 'package:dokan_ecommerce/screens/auth_ui/welcome/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dokan E-Commerce',
      theme: themeData,
      home: Welcome(),
    );
  }
}
