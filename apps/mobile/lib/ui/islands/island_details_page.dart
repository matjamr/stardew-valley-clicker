import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/state/island_providers.dart';

class IslandDetailsPage extends ConsumerStatefulWidget {
  final String variantKey;
  const IslandDetailsPage({super.key, required this.variantKey});

  @override
  ConsumerState<IslandDetailsPage> createState() => _IslandDetailsPageState();
}

class _IslandDetailsPageState extends ConsumerState<IslandDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  bool _submitting = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    super.dispose();
  }

  IconData _getIconForVariant(String variantKey) {
    switch (variantKey.toUpperCase()) {
      case 'VARIANT-STANDARD':
      case 'STANDARD':
        return Icons.agriculture;
      case 'VARIANT-RIVERLAND':
      case 'RIVERLAND':
        return Icons.water;
      case 'VARIANT-FOREST':
      case 'FOREST':
        return Icons.forest;
      default:
        return Icons.landscape;
    }
  }

  Color _getColorForVariant(String variantKey) {
    switch (variantKey.toUpperCase()) {
      case 'VARIANT-STANDARD':
      case 'STANDARD':
        return const Color(0xFF8BC34A);
      case 'VARIANT-RIVERLAND':
      case 'RIVERLAND':
        return const Color(0xFF2196F3);
      case 'VARIANT-FOREST':
      case 'FOREST':
        return const Color(0xFF4CAF50);
      default:
        return const Color(0xFFFFE7A0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final variantsAsync = ref.watch(islandVariantsProvider);
    final variantIcon = _getIconForVariant(widget.variantKey);
    final variantColor = _getColorForVariant(widget.variantKey);

    return Scaffold(
      appBar: AppBar(title: const Text('Create New Island')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Variant info card
              variantsAsync.when(
                data: (variants) {
                  IslandVariant? variant;
                  try {
                    variant = variants.firstWhere(
                      (v) => v.key == widget.variantKey,
                    );
                  } catch (e) {
                    variant = variants.firstOrNull;
                  }

                  if (variant == null) {
                    return const SizedBox.shrink();
                  }

                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: variantColor.withOpacity(0.5),
                        width: 2,
                      ),
                    ),
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
                                  variant.title,
                                  style: const TextStyle(
                                    color: Color(0xFFFFF3C4),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  variant.description,
                                  style: TextStyle(
                                    color: const Color(
                                      0xFFFFE7A0,
                                    ).withOpacity(0.8),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                loading: () => const Card(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
                error: (e, st) => const SizedBox.shrink(),
              ),
              const SizedBox(height: 24),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Color(0xFF7C5A4A), width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Farm Details',
                        style: TextStyle(
                          color: Color(0xFFFFF3C4),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _nameCtrl,
                        decoration: const InputDecoration(
                          labelText: 'Farm Name',
                          hintText: 'Enter your farm name',
                        ),
                        validator: (v) => (v == null || v.trim().isEmpty)
                            ? 'Please enter a farm name'
                            : null,
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
                          : const Text('Create Farm'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
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
        variantId: widget.variantKey,
        userId: 'user-001', // TODO: Get from auth
      );
      ref.read(selectedIslandIdProvider.notifier).state = id;
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed('/enterIsland', arguments: id);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to create farm: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }
}
