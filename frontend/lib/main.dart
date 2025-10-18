import 'package:flutter/material.dart';
import 'package:flutter_vaden/flutter_vaden.dart';
import 'package:frontend/core/config/app_router.dart';
import 'package:frontend/core/ui/theme.dart';
import 'package:frontend/data/repositories/auth_repository.dart';
import 'package:frontend/vaden_application.dart';
import 'package:lucid_validation/lucid_validation.dart';

void main() {
  LucidValidation.global.culture =  Culture('pt', 'BR');
  runApp(VadenApp(child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final repository = context.read<AuthRepository>();
    repository.isAuthenticated.addListener(() {
      if(!mounted) return;
      if(repository.isAuthenticated.value == AuthState.authenticated){
        AppRouter.router.go('/home');
      } else if(repository.isAuthenticated.value == AuthState.unauthenticated){
        AppRouter.router.go('/login');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      title: 'Flutter Demo',
      
      theme: lightTheme,
      
    );
  }
}
