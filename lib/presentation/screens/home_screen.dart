

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
            title: const Text("Cubits"),
            subtitle: const Text("Gestor de estado simple"),
            trailing: const Icon(Icons.arrow_back_ios_new_rounded),
            onTap: () => context.push('/cubits'),
          ),
          ListTile(
            title: const Text("Bloc"),
            subtitle: const Text("Gestor de estado completo"),
            trailing: const Icon(Icons.arrow_back_ios_new_rounded),
            onTap: () => context.push('/counter-bloc'),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(), 
          ),

          ListTile(
            title: const Text("Nuevo usuario"),
            subtitle: const Text("Manejo de formularios"),
            trailing: const Icon(Icons.app_registration),
            onTap: () => context.push('/new-user'),
          ),
        ],
      ),
    );
  }
}