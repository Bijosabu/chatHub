import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginServices {
  Future<void> loginUser(
      BuildContext context, String email, String password) async {
    final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    try {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        },
      );
      Navigator.of(context).pop();
      UserCredential _userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      _fireStore.collection('users').doc(_userCredential.user!.uid).set({
        'uid': _userCredential.user!.uid,
        'email': _userCredential.user!.email
      }, SetOptions(merge: true));
      // return userCredential;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
      throw (e.code);
    }
  }

  void logoutUser() async {
    FirebaseAuth.instance.signOut();
  }

  void signUpUser(BuildContext context, String email, String password,
      String confirmPwd) async {
    final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    try {
      if (password == confirmPwd) {
        UserCredential _userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        _fireStore.collection('users').doc(_userCredential.user!.uid).set({
          'uid': _userCredential.user!.uid,
          'email': _userCredential.user!.email
        });
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
