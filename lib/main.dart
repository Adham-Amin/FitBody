import 'package:firebase_core/firebase_core.dart';
import 'package:fitbody/core/utils/app_router.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FitBody());
}

class FitBody extends StatelessWidget {
  const FitBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      routerConfig: AppRouter.router,
    );
  }
}
