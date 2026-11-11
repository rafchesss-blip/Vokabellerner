import 'package:flutter/widgets.dart';

import 'app_localizations.dart';

export 'app_localizations.dart';

/// Sprachen der App: Code → Name in der eigenen Sprache (für die Auswahl).
const appLanguages = <String, String>{
  'de': 'Deutsch',
  'en': 'English',
  'es': 'Español',
  'fr': 'Français',
  'it': 'Italiano',
  'pt': 'Português',
  'pl': 'Polski',
  'tr': 'Türkçe',
  'ru': 'Русский',
  'zh': '中文',
};

bool _supported(String code) =>
    AppLocalizations.supportedLocales.any((l) => l.languageCode == code);

/// Sprache, die zum Gerät passt (sonst Englisch, sonst Deutsch).
String deviceLanguage() {
  final code =
      WidgetsBinding.instance.platformDispatcher.locale.languageCode;
  if (_supported(code)) return code;
  return _supported('en') ? 'en' : 'de';
}

/// Texte der aktuellen App-Sprache für Code ohne [BuildContext]
/// (Benachrichtigungen, KI-Anleitung, Modelle). In Widgets stattdessen
/// [L10nContext.l10n] benutzen – dann wird bei einem Sprachwechsel neu
/// gezeichnet.
AppLocalizations L = lookupAppLocalizations(const Locale('de'));

/// Stellt die App-Sprache für [L] um.
void setAppLanguage(String code) {
  L = lookupAppLocalizations(Locale(_supported(code) ? code : 'de'));
}

/// Aktuelle Sprache als Code (z. B. „de").
String get appLanguageCode => L.localeName;

extension L10nContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
