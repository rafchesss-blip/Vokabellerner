import 'package:flutter/material.dart';

import '../models/settings.dart';

/// Leuchtende Neon-Farbe für das gewählte Farbschema.
Color neonColor(NeonAccent accent) => switch (accent) {
      NeonAccent.violet => const Color(0xFF8B5CF6),
      NeonAccent.cyan => const Color(0xFF22D3EE),
      NeonAccent.emerald => const Color(0xFF34D399),
      NeonAccent.orange => const Color(0xFFFB923C),
      NeonAccent.pink => const Color(0xFFF472B6),
    };

/// Begleitfarbe für Farbverläufe (z. B. die Dashboard-Karte).
Color neonCompanion(NeonAccent accent) => switch (accent) {
      NeonAccent.violet => const Color(0xFF22D3EE),
      NeonAccent.cyan => const Color(0xFF8B5CF6),
      NeonAccent.emerald => const Color(0xFF22D3EE),
      NeonAccent.orange => const Color(0xFFF472B6),
      NeonAccent.pink => const Color(0xFF8B5CF6),
    };

/// Gedämpfte, dunklere Variante – im Light Mode besser lesbar auf Weiß.
Color deepColor(NeonAccent accent) =>
    Color.lerp(neonColor(accent), Colors.black, 0.3)!;

/// Dezente Textfarbe, passt sich automatisch an Dark/Light an.
Color muted(BuildContext context) =>
    Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.66);

/// Sehr dezente Farbe (z. B. für leere Zustände oder inaktive Elemente).
Color faint(BuildContext context) =>
    Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.38);

/// Baut die beiden Themes (Dark/Light) im Stil:
/// Dark Mode + Neo-Brutalismus + Glasmorphismus mit Neon-Akzenten.
class AppTheme {
  static const _darkBg = Color(0xFF0A0A0F);
  static const _darkSurface = Color(0xFF14141D);
  static const _darkSurfaceHigh = Color(0xFF1E1E29);
  static const _lightBg = Color(0xFFF4F4F7);
  static const _lightSurface = Colors.white;

  static ThemeData dark(NeonAccent accent) => _build(
        brightness: Brightness.dark,
        accent: accent,
        bg: _darkBg,
        surface: _darkSurface,
        surfaceHigh: _darkSurfaceHigh,
        onSurface: Colors.white,
      );

  static ThemeData light(NeonAccent accent) => _build(
        brightness: Brightness.light,
        accent: accent,
        bg: _lightBg,
        surface: _lightSurface,
        surfaceHigh: const Color(0xFFECECF1),
        onSurface: const Color(0xFF111114),
      );

  static ThemeData _build({
    required Brightness brightness,
    required NeonAccent accent,
    required Color bg,
    required Color surface,
    required Color surfaceHigh,
    required Color onSurface,
  }) {
    final isDark = brightness == Brightness.dark;
    final primary = isDark ? neonColor(accent) : deepColor(accent);
    final onPrimary = isDark ? _darkBg : Colors.white;
    final outline = onSurface.withValues(alpha: isDark ? 0.35 : 0.28);

    final base = ColorScheme.fromSeed(
      seedColor: primary,
      brightness: brightness,
    );
    final scheme = base.copyWith(
      primary: primary,
      onPrimary: onPrimary,
      secondary: neonCompanion(accent),
      onSecondary: isDark ? _darkBg : Colors.white,
      tertiary: neonCompanion(accent),
      onTertiary: isDark ? _darkBg : Colors.white,
      surface: surface,
      onSurface: onSurface,
      surfaceContainerHighest: surfaceHigh,
      outline: outline,
      error: isDark ? const Color(0xFFFF6B6B) : const Color(0xFFD32F2F),
    );

    final cardShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: BorderSide(color: outline, width: 1.5),
    );
    final buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: bg,
      appBarTheme: AppBarTheme(
        backgroundColor: surface.withValues(alpha: isDark ? 0.92 : 1.0),
        foregroundColor: onSurface,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: onSurface,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      cardTheme: CardThemeData(
        // Leicht transparent → Glasmorphismus-Look auf dem Hintergrund.
        color: surface.withValues(alpha: isDark ? 0.84 : 1.0),
        elevation: 0,
        shape: cardShape,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(color: outline, width: 2),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: surface.withValues(alpha: isDark ? 0.92 : 1.0),
        indicatorColor: primary.withValues(alpha: isDark ? 0.9 : 0.16),
        surfaceTintColor: Colors.transparent,
        height: 72,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: isDark ? onSurface.withValues(alpha: 0.35) : onSurface,
              width: 1.5,
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: onSurface,
          textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          side: BorderSide(color: outline, width: 1.5),
          shape: buttonShape,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceHigh.withValues(alpha: isDark ? 0.63 : 0.47),
        labelStyle: TextStyle(color: onSurface.withValues(alpha: 0.78)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: outline, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: outline, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: primary, width: 2),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: surfaceHigh,
        contentTextStyle: TextStyle(color: onSurface),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: outline),
        ),
      ),
      dividerTheme: DividerThemeData(color: outline),
      chipTheme: ChipThemeData(
        backgroundColor: surfaceHigh,
        side: BorderSide(color: outline),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
