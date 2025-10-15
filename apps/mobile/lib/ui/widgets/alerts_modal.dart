import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/state/app_providers.dart';
import 'package:mobile/state/ui_providers.dart';

class AlertsModal extends ConsumerWidget {
  final bool showClose;
  final bool embedded; // if true, render bare content for centered shell
  const AlertsModal({super.key, this.showClose = false, this.embedded = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alerts = ref.watch(alertsProvider);

    Widget body = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              const Icon(Icons.notifications, color: Color(0xFFFFE7A0)),
              const SizedBox(width: 8),
              const Text(
                'Alerts',
                style: TextStyle(
                  color: Color(0xFFFFF3C4),
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              if (alerts.isNotEmpty)
                TextButton(
                  onPressed: () {
                    ref.read(alertsProvider.notifier).clearAll();
                    ref.read(notificationsCountProvider.notifier).state = 0;
                  },
                  child: const Text('Clear all'),
                ),
              if (showClose)
                IconButton(
                  icon: const Icon(Icons.close, color: Color(0xFFFFE7A0)),
                  onPressed: () => Navigator.of(context).maybePop(),
                ),
            ],
          ),
        ),
        const Divider(height: 1, color: Color(0xFF7C5A4A)),
        Expanded(
          child: alerts.isEmpty
              ? const _EmptyAlerts()
              : ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(12),
                  itemCount: alerts.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (_, i) {
                    final a = alerts[i];
                    return Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF4A372F),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF7C5A4A),
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.notifications_active,
                            color: Color(0xFFFFE7A0),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  a.text,
                                  style: const TextStyle(
                                    color: Color(0xFFFFF3C4),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _timeAgo(a.time),
                                  style: const TextStyle(
                                    color: Color(0xFFFFE7A0),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ],
    );

    if (embedded) {
      return body;
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520, maxHeight: 520),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF3B2A24),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF7C5A4A), width: 2),
              ),
              child: body,
            ),
          ),
        ),
      ),
    );
  }

  String _timeAgo(DateTime time) {
    final d = DateTime.now().difference(time);
    if (d.inSeconds < 60) return '${d.inSeconds}s ago';
    if (d.inMinutes < 60) return '${d.inMinutes}m ago';
    if (d.inHours < 24) return '${d.inHours}h ago';
    return '${d.inDays}d ago';
  }
}

class _EmptyAlerts extends StatelessWidget {
  const _EmptyAlerts();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.notifications_off, color: Color(0xFFFFE7A0), size: 48),
          SizedBox(height: 8),
          Text('No alerts', style: TextStyle(color: Color(0xFFFFF3C4))),
        ],
      ),
    );
  }
}
