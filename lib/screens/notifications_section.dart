import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/settings.dart';
import '../services/notifications.dart';
import '../services/updates.dart';
import '../theme/app_theme.dart';
import '../utils/notification_plan.dart';

/// Einstellungen → „Erinnerungen".
///
/// In der Android-App: an/aus, wie oft am Tag, Test-Benachrichtigung.
/// Im Browser: Hinweis und Download-Link zur Android-App.
class NotificationsSection extends StatefulWidget {
  const NotificationsSection({super.key});

  @override
  State<NotificationsSection> createState() => _NotificationsSectionState();
}

class _NotificationsSectionState extends State<NotificationsSection> {
  final _settings = Settings.instance;

  String _times(int perDay) => reminderSlots[perDay]!
      .map((t) => '${t.$1}:${t.$2.toString().padLeft(2, '0')}')
      .join(', ');

  Future<void> _toggle(bool on) async {
    if (on && !await requestNotificationPermission()) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Benachrichtigungen sind blockiert. Erlaube sie in den '
          'Android-Einstellungen für den Vokabellerner.',
        ),
      ));
      return;
    }
    setState(() => _settings.notificationsEnabled = on);
    await _settings.save();
  }

  Future<void> _setPerDay(int n) async {
    setState(() => _settings.notificationsPerDay = n);
    await _settings.save();
  }

  @override
  Widget build(BuildContext context) {
    final title = Text(
      'Erinnerungen',
      style: Theme.of(context).textTheme.titleMedium,
    );

    if (!notificationsSupported) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          title,
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    '📱 Echte Erinnerungen gibt es in der Android-App: '
                    'mehrmals am Tag, mit aktuellen Zahlen und nie nach '
                    '21 Uhr.',
                  ),
                  const SizedBox(height: 12),
                  FilledButton.icon(
                    onPressed: () => launchUrl(Uri.parse(apkUrl)),
                    icon: const Icon(Icons.android),
                    label: const Text('Android-App herunterladen'),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    final on = _settings.notificationsEnabled;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        title,
        const SizedBox(height: 8),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SwitchListTile(
                value: on,
                onChanged: _toggle,
                secondary: const Icon(Icons.notifications_active_outlined),
                title: const Text('Lern-Erinnerungen'),
                subtitle: const Text(
                  'Mit aktuellen Zahlen – nie nach 21 Uhr. Ist für heute '
                  'alles gelernt, ist Ruhe.',
                ),
              ),
              if (on) ...[
                const Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                  child: Text(
                    'Wie oft am Tag?',
                    style: TextStyle(color: muted(context)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SegmentedButton<int>(
                    segments: const [
                      ButtonSegment(value: 1, label: Text('1×')),
                      ButtonSegment(value: 2, label: Text('2×')),
                      ButtonSegment(value: 3, label: Text('3×')),
                    ],
                    selected: {_settings.notificationsPerDay},
                    onSelectionChanged: (s) => _setPerDay(s.first),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
                  child: Text(
                    'um ${_times(_settings.notificationsPerDay)} Uhr',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: faint(context), fontSize: 13),
                  ),
                ),
                const Divider(height: 1),
                const ListTile(
                  leading: Icon(Icons.send_outlined),
                  title: Text('Test-Benachrichtigung senden'),
                  onTap: showTestNotification,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
