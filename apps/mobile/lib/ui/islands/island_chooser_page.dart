import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/state/island_providers.dart';

class IslandChooserPage extends ConsumerWidget {
  const IslandChooserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final islandsAsync = ref.watch(islandsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Choose Your Island')),
      body: islandsAsync.when(
        data: (islands) {
          if (islands.isEmpty) {
            return _EmptyState(onCreate: () => _goCreate(context));
          }
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: islands.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final island = islands[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(
                            color: Color(0xFF7C5A4A),
                            width: 2,
                          ),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          title: Text(
                            island.name,
                            style: const TextStyle(
                              color: Color(0xFFFFF3C4),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          subtitle: Text(
                            'Variant: ${island.variantKey}',
                            style: const TextStyle(color: Color(0xFFFFE7A0)),
                          ),
                          trailing: const Icon(
                            Icons.chevron_right,
                            color: Color(0xFFFFE7A0),
                          ),
                          onTap: () {
                            ref.read(selectedIslandIdProvider.notifier).state =
                                island.id;
                            Navigator.of(
                              context,
                            ).pushNamed('/enterIsland', arguments: island.id);
                          },
                        ),
                      );
                    },
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.add),
                        onPressed: () => _goCreate(context),
                        label: const Text('Create New Island'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Failed to load islands',
                style: TextStyle(color: Color(0xFFFFF3C4)),
              ),
              const SizedBox(height: 8),
              Text(
                e.toString(),
                style: const TextStyle(color: Colors.redAccent),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => ref.refresh(islandsProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _goCreate(BuildContext context) {
    Navigator.of(context).pushNamed('/createIsland/chooseVariant');
  }
}

class _EmptyState extends StatelessWidget {
  final VoidCallback onCreate;
  const _EmptyState({required this.onCreate});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.landscape, size: 64),
            const SizedBox(height: 12),
            const Text('No islands yet'),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              onPressed: onCreate,
              label: const Text('Create your first island'),
            ),
          ],
        ),
      ),
    );
  }
}
