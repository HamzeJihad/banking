
import 'package:flutter/material.dart';
import 'package:frontend/ui/auth/login_page.dart';
import 'package:frontend/ui/auth/register_page.dart';
import 'package:frontend/ui/splash/splash_page.dart';
import 'package:go_router/go_router.dart';


class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('Página: $title')),
    );
  }
}


class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',

    routes: <GoRoute>[
      GoRoute(
        path: '/splash',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashPage();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      ),

      GoRoute(
        path: '/register',
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterPage();
        },
      ),
      GoRoute(
        path: '/details/:id', 
        builder: (BuildContext context, GoRouterState state) {
          final String? id = state.pathParameters['id'];
          return PlaceholderScreen(title: 'Detalhes do Item $id'); 
        },
      ),
    ],

    errorBuilder: (context, state) => const Scaffold(
      body: Center(
        child: Text('Página não encontrada!'),
      ),
    ),
  );
}