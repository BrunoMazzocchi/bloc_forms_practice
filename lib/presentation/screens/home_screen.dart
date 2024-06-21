import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            onTap: () => context.push('/cubit'),
            title: const Text('Cubits'),
            subtitle: const Text('Counter Cubit'),
          ),
          ListTile(
            onTap: () => context.push('/bloc'),
            title: const Text('BLoCs'),
            subtitle: const Text('Counter Bloc'),
          ),
        ],
      ), 
    );
  }
}