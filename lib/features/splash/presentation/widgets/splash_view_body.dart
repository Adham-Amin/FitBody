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
  late final AnimationController _animationController;
  late final Animation<Offset> _slidingAnimation;

  @override
  void initState() {
    super.initState();
    _initSlidingAnimation();
    _listenToUserChanges(context);
  }

  @override
  void dispose() {
    _animationController.dispose();
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
        const SizedBox(height: 12),
        SlidingText(slidingAnimation: _slidingAnimation),
      ],
    );
  }

  void _listenToUserChanges(context) {
    FirebaseAuth.instance.userChanges().listen((User? user) {
      final route = user != null ? AppRouter.homeView : AppRouter.regiterView;
      Future.delayed(const Duration(seconds: 3), () {
        GoRouter.of(context).go(route);
      });
    });
  }

  void _initSlidingAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 3),
      end: Offset.zero,
    ).animate(_animationController);
    _animationController.forward();
  }
}
