import 'package:flutter/material.dart';
import 'package:mobile/game_page.dart';
import 'package:mobile/login_screen.dart';

void main() {
  runApp(const StardewClickerApp());
}

class StardewClickerApp extends StatelessWidget {
  const StardewClickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stardew Valley Clicker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF7C5A4A)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/game': (context) => const GamePage(),
      },
    );
  }
}
