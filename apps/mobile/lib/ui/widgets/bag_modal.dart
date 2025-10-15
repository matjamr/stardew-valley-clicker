import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/state/ui_providers.dart';

class BagModal extends ConsumerStatefulWidget {
  final bool showClose;
  final bool embedded; // if true, render bare content (for centered shell)
  const BagModal({super.key, this.showClose = false, this.embedded = true});

  @override
  ConsumerState<BagModal> createState() => _BagModalState();
}

class _BagModalState extends ConsumerState<BagModal>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _scale;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );
    _scale = Tween<double>(
      begin: 0.98,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutBack));
    _opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inventory = ref.watch(inventoryProvider);

    Widget body = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.inventory, color: Color(0xFFFFE7A0)),
            const SizedBox(width: 8),
            const Text(
              'Bag',
              style: TextStyle(
                color: Color(0xFFFFF3C4),
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
            ),
            const Spacer(),
            if (widget.showClose)
              IconButton(
                icon: const Icon(Icons.close, color: Color(0xFFFFE7A0)),
                onPressed: () => Navigator.of(context).maybePop(),
              ),
          ],
        ),
        const SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1.1,
          ),
          itemCount: inventory.length,
          itemBuilder: (_, i) {
            final e = inventory[i];
            return _BagSlot(entry: e);
          },
        ),
      ],
    );

    if (widget.embedded) {
      // Render bare content (the centered shell provides border/padding/animation)
      return body;
    }

    // Standalone fallback with previous decoration + animation
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: FadeTransition(
            opacity: _opacity,
            child: ScaleTransition(
              scale: _scale,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B2A24),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFF7C5A4A),
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: body,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BagSlot extends StatelessWidget {
  final InventoryEntry entry;
  const _BagSlot({required this.entry});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF4A372F),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF7C5A4A), width: 2),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(entry.item.icon, color: const Color(0xFFFFE7A0), size: 28),
          const SizedBox(height: 6),
          Text(
            entry.item.name,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Color(0xFFFFF3C4), fontSize: 12),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0xFF2E1F1A),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'x${entry.quantity}',
              style: const TextStyle(
                color: Color(0xFFFFE7A0),
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
