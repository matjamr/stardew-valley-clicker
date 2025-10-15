import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/state/ui_providers.dart';

class ProfileModal extends ConsumerStatefulWidget {
  final bool showClose;
  final bool embedded; // if true, render bare content inside centered shell
  const ProfileModal({super.key, this.showClose = false, this.embedded = true});

  @override
  ConsumerState<ProfileModal> createState() => _ProfileModalState();
}

class _ProfileModalState extends ConsumerState<ProfileModal>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  final _nameCtrl = TextEditingController();

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
    _nameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(profileProvider);
    _nameCtrl.text = profile.name;

    Widget body = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.person, color: Color(0xFFFFE7A0)),
            const SizedBox(width: 8),
            const Text(
              'Profile',
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
        const SizedBox(height: 12),
        Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: const Color(0xFF4A372F),
              child: Text(
                profile.name.isNotEmpty ? profile.name[0].toUpperCase() : '?',
                style: const TextStyle(
                  color: Color(0xFFFFE7A0),
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.circle, size: 10, color: Colors.amber),
                      const SizedBox(width: 6),
                      Text(
                        '${profile.gold}',
                        style: const TextStyle(
                          color: Color(0xFFFFE7A0),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Icon(
                        Icons.star,
                        size: 14,
                        color: Colors.orangeAccent,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Lv ${profile.level}',
                        style: const TextStyle(color: Color(0xFFFFE7A0)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _nameCtrl,
                    decoration: const InputDecoration(labelText: 'Farmer Name'),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton.icon(
            icon: const Icon(Icons.save),
            onPressed: () {
              ref.read(profileProvider.notifier).rename(_nameCtrl.text.trim());
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Profile updated')));
            },
            label: const Text('Save'),
          ),
        ),
      ],
    );

    if (widget.embedded) {
      return body;
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.98, end: 1.0).animate(
              CurvedAnimation(parent: _ctrl, curve: Curves.easeOutBack),
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF3B2A24),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF7C5A4A), width: 2),
                ),
                padding: const EdgeInsets.all(16),
                child: body,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
