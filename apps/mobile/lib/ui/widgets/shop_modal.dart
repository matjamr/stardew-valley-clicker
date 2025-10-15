import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/state/ui_providers.dart';

class ShopModal extends ConsumerStatefulWidget {
  final bool showClose;
  final bool
  embedded; // if true, render body without outer container (for centered shell)
  const ShopModal({super.key, this.showClose = false, this.embedded = true});

  @override
  ConsumerState<ShopModal> createState() => _ShopModalState();
}

class _ShopModalState extends ConsumerState<ShopModal>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    )..forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final catalog = ref.watch(shopCatalogProvider);
    final tabs = ShopCategory.values;

    Widget content = DefaultTabController(
      length: tabs.length,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: [
                const Icon(Icons.store, color: Color(0xFFFFE7A0)),
                const SizedBox(width: 8),
                const Text(
                  'Shop',
                  style: TextStyle(
                    color: Color(0xFFFFF3C4),
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                Consumer(
                  builder: (context, ref, _) {
                    final gold = ref.watch(profileProvider).gold;
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2E1F1A),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF7C5A4A),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            size: 10,
                            color: Colors.amber,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '$gold',
                            style: const TextStyle(
                              color: Color(0xFFFFE7A0),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                if (widget.showClose)
                  IconButton(
                    icon: const Icon(Icons.close, color: Color(0xFFFFE7A0)),
                    onPressed: () => Navigator.of(context).maybePop(),
                  ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF4A372F),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF7C5A4A), width: 1.5),
            ),
            child: TabBar(
              labelColor: const Color(0xFFFFE7A0),
              unselectedLabelColor: const Color(0xFFFFE7A0),
              indicator: BoxDecoration(
                color: const Color(0xFF6D4C41),
                borderRadius: BorderRadius.circular(10),
              ),
              tabs: const [
                Tab(text: 'Groceries', icon: Icon(Icons.local_grocery_store)),
                Tab(text: 'Seeds', icon: Icon(Icons.spa)),
                Tab(text: 'Utility', icon: Icon(Icons.construction)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: TabBarView(
                children: tabs.map((c) {
                  final items = catalog[c] ?? const [];
                  return _ShopList(items: items);
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );

    if (widget.embedded) {
      // Bare content for centered modal shell
      return content;
    }

    // Standalone with outer decoration and open animation
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.98, end: 1.0).animate(
              CurvedAnimation(parent: _ctrl, curve: Curves.easeOutBack),
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560, maxHeight: 520),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF3B2A24),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF7C5A4A), width: 2),
                ),
                child: content,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ShopList extends ConsumerWidget {
  final List<ShopItem> items;
  const _ShopList({required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (_, i) {
        final s = items[i];
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF4A372F),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF7C5A4A), width: 2),
          ),
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Icon(s.item.icon, color: const Color(0xFFFFE7A0), size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s.item.name,
                      style: const TextStyle(
                        color: Color(0xFFFFF3C4),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.circle, size: 10, color: Colors.amber),
                        const SizedBox(width: 6),
                        Text(
                          '${s.price}',
                          style: const TextStyle(color: Color(0xFFFFE7A0)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  final ok = ref
                      .read(profileProvider.notifier)
                      .spendGold(s.price);
                  if (ok) {
                    ref.read(inventoryProvider.notifier).addItem(s.item, 1);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Bought ${s.item.name}')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Not enough gold')),
                    );
                  }
                },
                child: const Text('Buy'),
              ),
            ],
          ),
        );
      },
    );
  }
}
