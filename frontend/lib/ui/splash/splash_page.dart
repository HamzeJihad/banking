import 'package:flutter/material.dart';
import 'package:frontend/core/ui/logo_widget.dart';
import 'package:frontend/ui/splash/stores/splash_store.dart';

class SplashPage extends StatefulWidget {
  final SplashStore store;
  const SplashPage({super.key, required this.store});

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
    await widget.store.getLoggedUser.execute();
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
