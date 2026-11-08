// Im Browser gibt es keine geplanten Benachrichtigungen (kein Server).

/// Ob echte Benachrichtigungen möglich sind.
bool get notificationsSupported => false;

Future<void> initNotifications() async {}

Future<bool> requestNotificationPermission() async => false;

Future<void> rescheduleNotifications() async {}

Future<void> showTestNotification() async {}
