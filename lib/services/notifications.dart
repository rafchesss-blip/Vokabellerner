/// Lern-Erinnerungen als echte Benachrichtigungen (nur Android-App).
library;

export 'notifications_stub.dart'
    if (dart.library.io) 'notifications_android.dart';
