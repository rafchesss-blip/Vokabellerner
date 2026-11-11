import 'package:flutter/material.dart';

import '../l10n/l10n.dart';

/// Farbe für eine Lernstufe (-5 .. +5).
///
/// 5 Grüntöne (gut), 1 Grau (neutral), 5 Rottöne (schlecht).
Color levelColor(int level) {
  switch (level) {
    case 5:
      return const Color(0xFF1B5E20);
    case 4:
      return const Color(0xFF2E7D32);
    case 3:
      return const Color(0xFF43A047);
    case 2:
      return const Color(0xFF66BB6A);
    case 1:
      return const Color(0xFFA5D6A7);
    case 0:
      return Colors.grey;
    case -1:
      return const Color(0xFFEF9A9A);
    case -2:
      return const Color(0xFFE57373);
    case -3:
      return const Color(0xFFD32F2F);
    case -4:
      return const Color(0xFFC62828);
    default:
      return const Color(0xFFB71C1C); // -5
  }
}

/// Passende Textfarbe auf [levelColor].
Color onLevelColor(int level) =>
    levelColor(level).computeLuminance() > 0.5 ? Colors.black : Colors.white;

/// Beschriftung für eine Lernstufe.
String levelLabel(int level) {
  switch (level) {
    case 5:
      return L.levelVeryGood;
    case 4:
      return L.levelGood;
    case 3:
      return L.levelQuiteGood;
    case 2:
      return L.levelOkay;
    case 1:
      return L.levelSlightlyGood;
    case 0:
      return L.levelNeutral;
    case -1:
      return L.levelSlightlyWeak;
    case -2:
      return L.levelWeak;
    case -3:
      return L.levelQuiteWeak;
    case -4:
      return L.levelBad;
    default:
      return L.levelVeryBad;
  }
}

/// Anzeige der Stufe, z. B. „+3", „0", „-2".
String levelText(int level) => level > 0 ? '+$level' : '$level';
