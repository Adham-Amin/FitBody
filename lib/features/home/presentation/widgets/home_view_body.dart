import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitbody/core/utils/app_router.dart';
import 'package:fitbody/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hello World', style: Styles.textBold26(context)),
          TextButton.icon(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              GoRouter.of(context).go(AppRouter.regiterView);
            },
            label: Text('Logout', style: Styles.textNormal14(context)),
            icon: Icon(Icons.logout, color: Colors.red),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
