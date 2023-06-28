import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginServices {
  Future<void> loginUser(
      BuildContext context, String email, String password) async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        },
      );
      Navigator.of(context).pop();
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // return userCredential;
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      throw (e.code);
    }
  }

  void logoutUser() async {
    FirebaseAuth.instance.signOut();
  }

  void signUpUser(BuildContext context, String email, String password,
      String confirmPwd) async {
    try {
      if (password == confirmPwd) {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Passwords does not match')));
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
      // throw (e.code);
    }
  }
}
