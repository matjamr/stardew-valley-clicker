import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/state/island_providers.dart';

class IslandVariantSelectPage extends ConsumerWidget {
  const IslandVariantSelectPage({super.key});

  IconData _getIconForVariant(String namedVariant) {
    switch (namedVariant.toUpperCase()) {
      case 'STANDARD':
        return Icons.agriculture;
      case 'RIVERLAND':
        return Icons.water;
      case 'FOREST':
        return Icons.forest;
      default:
        return Icons.landscape;
    }
  }

  Color _getColorForVariant(String namedVariant) {
    switch (namedVariant.toUpperCase()) {
      case 'STANDARD':
        return const Color(0xFF8BC34A); // green
      case 'RIVERLAND':
        return const Color(0xFF2196F3); // blue
      case 'FOREST':
        return const Color(0xFF4CAF50); // dark green
      default:
        return const Color(0xFFFFE7A0);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final variantsAsync = ref.watch(islandVariantsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Select Island Variant')),
      body: variantsAsync.when(
        data: (variants) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            itemCount: variants.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final v = variants[index];
              final variantIcon = _getIconForVariant(v.description);
              final variantColor = _getColorForVariant(v.description);

              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: variantColor.withOpacity(0.5), width: 2),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      '/createIsland/details',
                      arguments: v.key,
                    );
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: variantColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            variantIcon,
                            size: 36,
                            color: variantColor,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                v.title,
                                style: const TextStyle(
                                  color: Color(0xFFFFF3C4),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                v.description,
                                style: TextStyle(
                                  color: const Color(0xFFFFE7A0).withOpacity(0.8),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: variantColor,
                          size: 28,
                        ),
                      ],
                    ),
                  ),
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
              const Icon(
                Icons.error_outline,
                color: Colors.redAccent,
                size: 48,
              ),
              const SizedBox(height: 16),
              const Text(
                'Failed to load variants',
                style: TextStyle(
                  color: Color(0xFFFFF3C4),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                e.toString(),
                style: const TextStyle(color: Colors.redAccent),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => ref.refresh(islandVariantsProvider),
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
