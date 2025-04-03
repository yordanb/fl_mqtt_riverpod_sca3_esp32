import 'package:go_router/go_router.dart';
import '../pages/login_page.dart';
import '../pages/dashboard_page.dart';
import '../pages/profile_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LoginPage()),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardPage(),
    ),
    GoRoute(path: '/profile', builder: (context, state) => const ProfilePage()),
  ],
);
