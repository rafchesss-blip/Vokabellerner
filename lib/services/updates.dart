import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

/// Automatische Updates der Android-App.
///
/// GitHub Actions baut bei jedem Push eine neue APK und legt sie zusammen
/// mit `version.json` auf GitHub Pages. Die App vergleicht beim Start ihre
/// eigene Build-Nummer damit und bietet das Update an.

/// Adresse der veröffentlichten App (GitHub Pages).
const String siteUrl = 'https://rafchesss-blip.github.io/Vokabellerner/';

/// Download-Adresse der Android-App.
const String apkUrl = '${siteUrl}vokabellerner.apk';

/// Build-Nummer dieser App (wird beim Bauen gesetzt, lokal 0).
const int appBuild = int.fromEnvironment('APP_BUILD');

/// Ob die Update-Prüfung sinnvoll ist (nur Android-App aus GitHub Actions).
bool get updatesSupported =>
    !kIsWeb && defaultTargetPlatform == TargetPlatform.android && appBuild > 0;

/// Liefert die neuere Build-Nummer, falls es ein Update gibt, sonst `null`.
Future<int?> checkForUpdate() async {
  if (!updatesSupported) return null;
  try {
    final res = await http
        .get(Uri.parse('${siteUrl}version.json'))
        .timeout(const Duration(seconds: 8));
    if (res.statusCode != 200) return null;
    final latest = (jsonDecode(res.body)['build'] as num?)?.toInt() ?? 0;
    return latest > appBuild ? latest : null;
  } catch (_) {
    return null; // offline – nächstes Mal wieder
  }
}

/// Öffnet den Download der neuen APK im Browser (Android installiert sie).
Future<void> openApkDownload() =>
    launchUrl(Uri.parse(apkUrl), mode: LaunchMode.externalApplication);
