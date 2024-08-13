import 'package:front_end/ui_screens/auth_ui/login_screen.dart';
import 'package:front_end/ui_screens/dashboard_ui/dashboard_screen.dart';
import 'package:front_end/ui_screens/home_ui/home.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter _router;

  AppRouter()
      : _router = GoRouter(
          routes: [
            GoRoute(
              path: '/',
              name: 'login',
              builder: (context, state) => LoginScreen(),
            ),
            GoRoute(
              path: '/dashboard',
              name: 'dashboard',
              builder: (context, state) => const DashboardScreen(),
            ),
            GoRoute(
              path: '/home',
              name: 'home',
              builder: (context, state) => const Home(),
            ),
          ],
        );

  GoRouter get router => _router;
}
