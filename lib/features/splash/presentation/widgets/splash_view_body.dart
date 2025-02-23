import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitbody/core/utils/app_router.dart';
import 'package:fitbody/core/utils/assets_data.dart';
import 'package:fitbody/features/splash/presentation/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    slidingAnimate();
    navigateToHome(context);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AssetsData.logo,
          height: 75,
          width: 75,
        ),
        const SizedBox(
          height: 12,
        ),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void navigateToHome(context) {
    Future.delayed(const Duration(seconds: 3), () {
      if(FirebaseAuth.instance.currentUser != null) {
        GoRouter.of(context).go(AppRouter.homeView);
      } else {
        GoRouter.of(context).go(AppRouter.onbordingView);
      }
    });
  }

  void slidingAnimate() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }
}
