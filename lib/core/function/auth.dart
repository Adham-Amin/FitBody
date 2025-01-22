// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitbody/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final auth = FirebaseAuth.instance;
Future<void> authentication({
  required bool isLogin,
  required String email,
  required String pass,
  required BuildContext ctx,
  required String? name,
  required int? age,
  required String? gender
}) async {
  try {
    showDialog(
      context: ctx,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    if (isLogin) {
      await auth.signInWithEmailAndPassword(email: email, password: pass);
    } else {
      UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.user!.uid)
          .set({
        'Name': name,
        'Age': age,
        'Email': email,
        'Password': pass,
        'Gender': gender,
      });
    }

    GoRouter.of(ctx).pop();
    GoRouter.of(ctx).replace(AppRouter.homeView);
  } on FirebaseAuthException catch (e) {
    GoRouter.of(ctx).pop();
    String message = 'An error occurred, please try again.';
    if (e.code == 'user-not-found') {
      message = 'No user found for that email.';
    } else if (e.code == 'wrong-password') {
      message = 'Wrong password provided for that user.';
    } else if (e.code == 'weak-password') {
      message = 'The password provided is too weak.';
    } else if (e.code == 'email-already-in-use') {
      message = 'The account already exists for that email.';
    }
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}
