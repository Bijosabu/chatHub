import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginServices {
  Future<void> loginUser(BuildContext context, email, String password) async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        },
      );
      Navigator.of(context).pop();
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print('ERROR:$e');
    }
  }
}
