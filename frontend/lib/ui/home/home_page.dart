import 'package:flutter/material.dart';
import 'package:flutter_vaden/flutter_vaden.dart';
import 'package:frontend/ui/home/stores/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final store = context.read<HomeStore>();
            store.logoutCommand.execute();
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}