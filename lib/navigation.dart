import 'package:flutter/foundation.dart';

/// Steuert, welcher Tab der HomeShell aktiv ist (0 = Start, 1 = Lektionen, 2 = Analyse).
///
/// Wird vom globalen Home-Button verwendet, um immer zur Startseite
/// zurückzukehren.
final ValueNotifier<int> shellTabIndex = ValueNotifier<int>(0);
