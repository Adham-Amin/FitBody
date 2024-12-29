import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitbody/features/auth/presentation/widgets/register_view_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> submitAuth(
    String email,
    String pass,
    String name,
    BuildContext ctx,
  ) async {
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
    } on FirebaseAuthException catch (e) {
      String message = 'Fields are empty';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }
      ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),);
    } catch (e) {
      print(e);
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterViewBody(
        onTap: submitAuth,
      ),
    );
  }
}
