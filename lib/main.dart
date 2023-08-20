import 'package:dokan_ecommerce/constants/theme.dart';
import 'package:dokan_ecommerce/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:dokan_ecommerce/firebase_helper/firebase_options/firebase_options.dart';
import 'package:dokan_ecommerce/screens/auth_ui/welcome/welcome.dart';
import 'package:dokan_ecommerce/screens/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
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
      home: StreamBuilder(
        stream: FirebaseAuthHelper.instance.getAuthChange,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Home();
          }
          return const Welcome();
        },
      ),
    );
  }
}
