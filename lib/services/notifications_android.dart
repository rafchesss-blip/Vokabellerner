import 'dart:io';
import 'dart:ui' show Color;

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

import '../data/store.dart';
import '../models/settings.dart';
import '../utils/notification_plan.dart';

final _plugin = FlutterLocalNotificationsPlugin();
bool _ready = false;

const _details = NotificationDetails(
  android: AndroidNotificationDetails(
    'lernen',
    'Lern-Erinnerungen',
    channelDescription: 'Erinnert dich ans Vokabellernen (nie nach 21 Uhr).',
    importance: Importance.high,
    priority: Priority.high,
    icon: 'ic_notification',
    color: _accent,
  ),
);

// Neon-Violett der App.
const _accent = Color.fromARGB(255, 139, 92, 246);

/// Ob echte Benachrichtigungen möglich sind.
bool get notificationsSupported => Platform.isAndroid;

/// Einmal beim App-Start aufrufen.
Future<void> initNotifications() async {
  if (!notificationsSupported || _ready) return;
  tzdata.initializeTimeZones();
  try {
    final zone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(zone.identifier));
  } catch (_) {
    tz.setLocalLocation(tz.getLocation('Europe/Berlin'));
  }
  await _plugin.initialize(
    settings: const InitializationSettings(
      android: AndroidInitializationSettings('ic_notification'),
    ),
  );
  _ready = true;
}

AndroidFlutterLocalNotificationsPlugin? get _android =>
    _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

/// Fragt (ab Android 13) nach der Erlaubnis für Benachrichtigungen.
Future<bool> requestNotificationPermission() async {
  if (!notificationsSupported) return false;
  await initNotifications();
  final granted = await _android?.requestNotificationsPermission();
  return granted ?? await _android?.areNotificationsEnabled() ?? false;
}

/// Plant alle Erinnerungen neu – mit dem aktuellen Lernstand.
///
/// Wird beim Start, beim Zurückkehren in die App und nach jedem Lernen
/// aufgerufen. So stimmen die Zahlen in den Benachrichtigungen immer.
Future<void> rescheduleNotifications() async {
  if (!notificationsSupported) return;
  await initNotifications();
  await _plugin.cancelAll();

  final settings = Settings.instance;
  if (!settings.notificationsEnabled) return;

  final store = Store.instance;
  final lists = [for (final l in store.practiceLists) if (l.notify) l];
  final pool = store.resolveVocabs({for (final l in lists) ...l.vocabIds});
  final planned = planNotifications(
    pool: pool,
    lists: lists,
    perDay: settings.notificationsPerDay,
    streak: store.streak(),
    practicedToday: store.reviewsToday > 0,
  );

  for (var i = 0; i < planned.length; i++) {
    final n = planned[i];
    await _plugin.zonedSchedule(
      id: i,
      scheduledDate: tz.TZDateTime.from(n.time, tz.local),
      notificationDetails: _details,
      // Ungefähr pünktlich reicht – dafür braucht es keine Sonderrechte.
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      title: n.title,
      body: n.body,
    );
  }
}

/// Zeigt sofort eine Beispiel-Benachrichtigung (zum Ausprobieren).
Future<void> showTestNotification() async {
  if (!notificationsSupported) return;
  await initNotifications();
  await _plugin.show(
    id: 9999,
    title: '👋 Hallo! So sehen deine Erinnerungen aus',
    body: 'Ich melde mich, wenn Vokabeln auf dich warten – nie nach 21 Uhr.',
    notificationDetails: _details,
  );
}
