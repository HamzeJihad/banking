import 'package:flutter/material.dart';
import 'package:frontend/ui/home/stores/home_store.dart';

class HomePage extends StatefulWidget {
  final HomeStore homeStore;
  const HomePage({super.key, required this.homeStore});

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
            final store = widget.homeStore;
            store.logoutCommand.execute();
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}