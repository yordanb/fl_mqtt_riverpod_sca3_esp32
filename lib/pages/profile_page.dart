import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Aplikasi')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('Versi Aplikasi: 1.0.0\nDibuat dengan Flutter & MQTT'),
          ),

          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              context.go('/dashboard'); // Simulasi login langsung ke dashboard
            },
            child: const Text('Dashboard'),
          ),
        ],
      ),
    );
  }
}
