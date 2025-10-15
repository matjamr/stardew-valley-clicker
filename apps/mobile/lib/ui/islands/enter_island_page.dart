import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/state/island_providers.dart';

class EnterIslandPage extends ConsumerStatefulWidget {
  final String islandId;
  const EnterIslandPage({super.key, required this.islandId});

  @override
  ConsumerState<EnterIslandPage> createState() => _EnterIslandPageState();
}

class _EnterIslandPageState extends ConsumerState<EnterIslandPage> {
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_started) {
      _started = true;
      _enter();
    }
  }

  Future<void> _enter() async {
    final repo = ref.read(islandRepositoryProvider);
    final ok = await repo.enterIsland(widget.islandId);
    if (!mounted) return;
    if (ok) {
      ref.read(selectedIslandIdProvider.notifier).state = widget.islandId;
      Navigator.of(context).pushReplacementNamed('/game');
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Failed to enter island')));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            SizedBox(height: 8),
            CircularProgressIndicator(color: Color(0xFFFFE7A0)),
            SizedBox(height: 12),
            Text(
              'Entering your island...',
              style: TextStyle(
                color: Color(0xFFFFF3C4),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
