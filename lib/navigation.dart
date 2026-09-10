import 'package:flutter/foundation.dart';

/// Steuert, welcher Tab der HomeShell aktiv ist (0 = Dashboard, 1 = Analyse).
///
/// Wird vom globalen Home-Button verwendet, um immer zum Dashboard
/// zurückzukehren.
final ValueNotifier<int> shellTabIndex = ValueNotifier<int>(0);
