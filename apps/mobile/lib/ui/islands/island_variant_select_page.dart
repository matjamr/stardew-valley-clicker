import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/state/island_providers.dart';

class IslandVariantSelectPage extends ConsumerWidget {
  const IslandVariantSelectPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final variantsAsync = ref.watch(islandVariantsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Select Island Variant')),
      body: variantsAsync.when(
        data: (variants) => Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.separated(
            itemCount: variants.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final v = variants[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Color(0xFF7C5A4A), width: 2),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  title: Text(
                    v.title,
                    style: const TextStyle(
                      color: Color(0xFFFFF3C4),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(
                    v.description,
                    style: const TextStyle(color: Color(0xFFFFE7A0)),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Color(0xFFFFE7A0),
                  ),
                  onTap: () {
                    Navigator.of(
                      context,
                    ).pushNamed('/createIsland/details', arguments: v.key);
                  },
                ),
              );
            },
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Failed to load variants',
                style: TextStyle(color: Color(0xFFFFF3C4)),
              ),
              const SizedBox(height: 8),
              Text(
                e.toString(),
                style: const TextStyle(color: Colors.redAccent),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => ref.refresh(islandVariantsProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
