import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/game_page.dart';
import 'package:mobile/login_screen.dart';
import 'package:mobile/ui/islands/enter_island_page.dart';
import 'package:mobile/ui/islands/island_chooser_page.dart';
import 'package:mobile/ui/islands/island_details_page.dart';
import 'package:mobile/ui/islands/island_variant_select_page.dart';

void main() {
  runApp(const ProviderScope(child: StardewClickerApp()));
}

class StardewClickerApp extends StatelessWidget {
  const StardewClickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stardew Valley Clicker',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7C5A4A),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF2E1F1A),
        cardColor: const Color(0xFF3B2A24),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF3B2A24),
          foregroundColor: Color(0xFFFFE7A0),
          elevation: 4,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Color(0xFFFFE7A0),
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        dividerColor: const Color(0xFF7C5A4A),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8BC34A),
            foregroundColor: const Color(0xFF1B1B1B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFFFFE7A0),
            side: const BorderSide(color: Color(0xFF7C5A4A), width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF4A372F),
          labelStyle: const TextStyle(color: Color(0xFFFFE7A0)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF7C5A4A), width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFFFE7A0), width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: Color(0xFFFFE7A0),
          textColor: Color(0xFFFFF3C4),
          tileColor: Color(0xFF3B2A24),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        late final Widget page;
        switch (settings.name) {
          case '/':
            page = const LoginScreen();
            break;
          case '/islands':
            page = const IslandChooserPage();
            break;
          case '/createIsland/chooseVariant':
            page = const IslandVariantSelectPage();
            break;
          case '/createIsland/details':
            final args = settings.arguments as String?;
            page = IslandDetailsPage(variantKey: args ?? 'standard');
            break;
          case '/enterIsland':
            final args = settings.arguments as String?;
            final id = args ?? '';
            page = EnterIslandPage(islandId: id);
            break;
          case '/game':
            page = const GamePage();
            break;
          default:
            page = const LoginScreen();
        }
        return PageRouteBuilder(
          settings: settings,
          transitionDuration: const Duration(milliseconds: 400),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curved = CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
              reverseCurve: Curves.easeInCubic,
            );
            final blur = Tween<double>(begin: 0.0, end: 10.0).animate(curved);
            final scale = Tween<double>(begin: 0.985, end: 1.0).animate(curved);
            final opacity = Tween<double>(begin: 0.0, end: 1.0).animate(curved);
            return AnimatedBuilder(
              animation: animation,
              builder: (context, _) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: blur.value,
                          sigmaY: blur.value,
                        ),
                        child: Container(color: Colors.transparent),
                      ),
                    ),
                    FadeTransition(
                      opacity: opacity,
                      child: ScaleTransition(scale: scale, child: child),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
