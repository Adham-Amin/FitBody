import 'package:fitbody/features/splash/presentation/pages/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const regiterView = '/regiterView';
  static const loginView = '/loginView';
  static const homeView = '/homeView';
  static const onbordingView = '/onbordingView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashView(),
      ),
    ],
  );
}
