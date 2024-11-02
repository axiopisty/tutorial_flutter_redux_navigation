import 'package:go_router/go_router.dart';
import 'package:tutorial_flutter_redux_navigation/pages/home_page.dart';
import 'package:tutorial_flutter_redux_navigation/pages/login_page.dart';

final router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/', builder: (_, __) => const HomePage(),
      routes: [
        GoRoute(
          path: '/login', builder: (_, __) => const LoginPage(),
        ),
      ],
    ),
  ],
);
