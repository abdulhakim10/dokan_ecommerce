// import 'package:dokan_ecommerce/constants/routes.dart';
// import 'package:dokan_ecommerce/screens/home/home.dart';
// ignore_for_file: use_build_context_synchronously

import 'package:dokan_ecommerce/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class FirebaseAuthHelper {
  static FirebaseAuthHelper instance = FirebaseAuthHelper();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get getAuthChange => _auth.authStateChanges();

// login method
  Future<bool> login(
      String email, String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      showMessage(e.code.toString());
      return false;
    }
  }

  // sign up method
  Future<bool> signUp(
      String email, String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      showMessage(e.code.toString());
      return false;
    }
  }
}
