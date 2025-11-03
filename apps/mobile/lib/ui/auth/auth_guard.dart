import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/state/app_providers.dart';
import 'package:mobile/ui/auth/login_page.dart';

/// Widget that guards protected routes and redirects to login if not authenticated
class AuthGuard extends ConsumerWidget {
  final Widget child;

  const AuthGuard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    // If not authenticated, show login page
    if (!authState.isAuthenticated) {
      // Use addPostFrameCallback to avoid building during build
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          Navigator.of(context).pushReplacementNamed('/');
        }
      });
      return const LoginPage();
    }

    // If authenticated, show the protected page
    return child;
  }
}
