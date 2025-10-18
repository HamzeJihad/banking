import 'package:flutter/material.dart';
import 'package:flutter_vaden/flutter_vaden.dart';
import 'package:frontend/core/ui/logo_widget.dart';
import 'package:frontend/data/repositories/auth_repository.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _handleSplashLogic();
  }

  Future<void> _handleSplashLogic() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    await context.read<AuthRepository>().getLoggedUser();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Hero(tag: 'app_logo', child: LogoWidget()),
      ),
    );
  }
}
