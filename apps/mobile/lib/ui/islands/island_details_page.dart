import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/state/island_providers.dart';

import '../widgets/terrain_grid.dart';

class IslandDetailsPage extends ConsumerStatefulWidget {
  final String variantKey;
  const IslandDetailsPage({super.key, required this.variantKey});

  @override
  ConsumerState<IslandDetailsPage> createState() => _IslandDetailsPageState();
}

class _IslandDetailsPageState extends ConsumerState<IslandDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  bool _submitting = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final variantsAsync = ref.watch(islandVariantsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Island Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Variant preview
              variantsAsync.when(
                data: (variants) {
                  final v = variants.firstWhere(
                    (e) => e.key == widget.variantKey,
                    orElse: () => variants.first,
                  );
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(
                        color: Color(0xFF7C5A4A),
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Variant: ${v.title}',
                            style: const TextStyle(
                              color: Color(0xFFFFF3C4),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TerrainGrid(
                            terrain: v.terrains.first,
                            maxWidth: 340,
                            maxHeight: 160,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                loading: () => const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (e, st) => const SizedBox.shrink(),
              ),
              const SizedBox(height: 12),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Color(0xFF7C5A4A), width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameCtrl,
                        decoration: const InputDecoration(
                          labelText: 'Island Name',
                        ),
                        validator: (v) => (v == null || v.trim().isEmpty)
                            ? 'Please enter a name'
                            : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _descCtrl,
                        decoration: const InputDecoration(
                          labelText: 'Description (optional)',
                        ),
                        minLines: 2,
                        maxLines: 4,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _submitting
                          ? null
                          : () => Navigator.of(context).maybePop(),
                      child: const Text('Back'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _submitting ? null : _onCreate,
                      child: _submitting
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Create Island'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onCreate() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() => _submitting = true);
    try {
      final repo = ref.read(islandRepositoryProvider);
      final id = await repo.createIsland(
        name: _nameCtrl.text.trim(),
        variantKey: widget.variantKey,
        description: _descCtrl.text.trim().isEmpty
            ? null
            : _descCtrl.text.trim(),
      );
      ref.read(selectedIslandIdProvider.notifier).state = id;
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed('/enterIsland', arguments: id);
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }
}
