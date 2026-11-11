import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:vokabellerner/l10n/l10n.dart';
import 'package:vokabellerner/models/practice_list.dart';
import 'package:vokabellerner/models/vocab.dart';
import 'package:vokabellerner/utils/ai_scan.dart';
import 'package:vokabellerner/utils/fsrs.dart';
import 'package:vokabellerner/utils/notification_plan.dart';

void main() {
  tearDown(() => setAppLanguage('de'));

  test('Alle 10 Sprachen sind da und vollständig nutzbar', () {
    expect(
      AppLocalizations.supportedLocales.map((l) => l.languageCode).toSet(),
      appLanguages.keys.toSet(),
    );

    final lesson = Lesson(
      id: 'l',
      name: 'L',
      boxes: [],
      language: 'Latein',
      hasForms: true,
      allForms: true,
      extraLabels: ['X'],
    );
    final pool = [Vocab(id: 'v', latin: 'a', german: 'b')];

    for (final code in appLanguages.keys) {
      setAppLanguage(code);
      expect(appLanguageCode, code);

      // KI-Anleitung: Marker drin, als Anleitung (nicht als Antwort) erkannt.
      final prompt = buildScanPrompt(lesson);
      expect(prompt, contains(scanMarker), reason: code);
      expect(looksLikeScanAnswer(prompt), isFalse, reason: code);

      // Erinnerungen mit Namen und Zeitangaben.
      final plan = planNotifications(
        pool: pool,
        lists: [PracticeList(id: 'p', name: 'T', vocabIds: ['v'])],
        perDay: 3,
        streak: 2,
        practicedToday: false,
        name: 'Rafael',
        now: DateTime(2026, 3, 2, 8),
      );
      expect(plan, isNotEmpty, reason: code);
      expect(plan.every((n) => n.title.isNotEmpty && n.body.isNotEmpty), isTrue);
      expect(formatInterval(const Duration(days: 3)), isNotEmpty);
    }
  });

  test('Datenschutzerklärung gibt es in jeder Sprache', () {
    for (final code in appLanguages.keys) {
      final file = File('privacy/$code.md');
      expect(file.existsSync(), isTrue, reason: code);
      expect(file.readAsStringSync(), startsWith('# '), reason: code);
    }
  });
}
