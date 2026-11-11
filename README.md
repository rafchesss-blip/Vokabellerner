# Vokabeltrainer (Google-Play-Version)

> Dieser Zweig (`play`) ist die Version für Google Play. Die Latein-Version
> für den Browser liegt auf `main` und wird von hier aus nicht verändert.

Ein Vokabeltrainer für jede Sprache. Lektionen legt man selbst an: Die
Vokabeln tippt man ein oder fotografiert sie und lässt sie von einer
KI-App (ChatGPT, Gemini, …) ablesen. Kostenlos, ohne Werbung und ohne
Konto. Alles bleibt auf dem Handy ([Datenschutz](privacy/de.md)).

## Eigene Lektionen und Scannen

- **Lektion anlegen** (Tab „Lektionen“): Name, Sprache, Sprache der
  Übersetzung. Dazu, was eingegeben wird: Wort und Übersetzung immer,
  **Formen** auf Wunsch (Verb-, Nomen-, Adjektivformen, Geschlecht, beliebig
  kombinierbar) und bis zu drei **Sonstiges**-Felder mit eigenem Namen.
- **Selbst eingeben:** Formular mit genau diesen Feldern.
- **Scannen:** Foto aufnehmen → die App teilt Foto und Anleitung
  (`lib/utils/ai_scan.dart`) mit einer KI-App. Die KI antwortet mit einem
  Textblock, der mit `#VOKABELN` beginnt, eine Zeile pro Vokabel, Spalten mit
  `|` getrennt. Kopiert man die Antwort und kehrt zurück, erkennt die App sie
  in der Zwischenablage, zeigt eine Vorschau und übernimmt die Vokabeln.
  Ganz automatisch zurück geht es nicht: KI-Apps geben keine Antwort an
  andere Apps zurück.
- **Test:** Unter Einstellungen → „Sonstiges mit abfragen“ werden auch die
  Sonstiges-Felder abgefragt.

## Funktionen

- **Übungslisten:** Du stellst Vokabeln zu Listen zusammen (z. B.
  „Vokabeltest 1“), optional mit Testdatum. Gelernt wird immer über
  Übungslisten.
- **Startseite „Heute“:** zeigt fällige Wiederholungen und neue Vokabeln
  aus deinen Übungslisten. Ein Tipp auf „Los geht's“ startet die Runde.
  Dazu gibt es eine Lernserie (🔥 Tage in Folge) und eine Tagesstatistik.
- **Spaced Repetition mit FSRS-6:** derselbe Algorithmus wie in Anki
  (`lib/utils/fsrs.dart`). Jede Vokabel hat eine Stabilität und eine
  Schwierigkeit, daraus berechnet die App den nächsten Termin. Ziel ist,
  dass du dich an 90 % erinnerst. Pro Runde kommen höchstens 15 neue
  Vokabeln dazu.
- **Karteikarten:** Die Karte dreht sich um, du bewertest mit Nochmal, Schwer,
  Gut oder Leicht und siehst vorher, wann die Karte wiederkommt.
  Am PC: Leertaste zum Umdrehen, 1–4 zum Bewerten.
- **Test-Modus:** Du tippst die Übersetzung und/oder die Formen ein, auf
  Wunsch auch die Sonstiges-Felder. Die Prüfung ignoriert Makronen (ā = a)
  und Artikel.
- **Testdatum:** Hat eine Übungsliste ein Testdatum, verteilt die App die
  neuen Vokabeln gleichmäßig auf die Tage bis zum **Vortag** des Tests (am
  Testtag selbst wird nicht mehr geübt). Je näher der Test, desto kürzer die
  Abstände: höchstens die halbe Restzeit. Am Vortag wird alles noch einmal
  wiederholt. Die Startseite zeigt einen Countdown.
- **Benachrichtigungen:** bis zu 3-mal am Tag (14:30, 17:30
  und 20:15 Uhr), nie nach 21 Uhr. Die Texte zeigen die aktuellen Zahlen,
  wechseln jeden Tag und werden vor einem Test dringender. Bei jedem
  Öffnen und nach jedem Lernen plant die App sie neu. Ist für heute alles
  gelernt, kommt keine Erinnerung mehr.
- **Lektionen:** keine eingebauten – jede Lektion legst du selbst an
  (siehe oben). Der Tab „Lektionen“ zeigt sie mit deinem Fortschritt.
- **Analyse:** Jede Vokabel hat eine Lernstufe (−5 bis +5) mit Verlauf.
  Außerdem siehst du, wie gut du sie gerade noch weißt und wann sie wieder
  drankommt.
- **Sicherung:** Unter Einstellungen → Daten & Sicherung exportierst du eine
  Datei und importierst sie wieder, auch auf einem anderen Gerät.

## Für Google Play bauen

```bash
flutter build appbundle --release
```

Ergebnis: `build/app/outputs/bundle/release/app-release.aab`. Diese Datei
kommt in die Play Console. Für jede neue Version vorher in `pubspec.yaml`
die Nummer hinter dem `+` erhöhen (`1.0.0+1` → `1.0.1+2`).

- App-ID: `io.github.rafchesss.vokabeltrainer`. Nach der ersten
  Veröffentlichung nie mehr ändern.
- Signiert wird mit dem Schlüssel aus `android/key.properties` (liegt nicht im
  Repo, siehe `C:\Users\rafch\.vokabellerner-signatur\`). Bei Google Play
  ist das der **Upload-Schlüssel**: Google signiert die App danach selbst
  (Play App Signing).
- Zum Ausprobieren ohne Play Store: `flutter build apk --release`.

## Entwickeln

```bash
flutter pub get
flutter run               # auf dem Handy/Emulator starten
flutter test              # Tests
```

GitHub Actions baut nur `main` (Web-Version); dieser Zweig wird lokal
gebaut.

## Aufbau

```
lib/
  data/               Speicher (shared_preferences)
  models/             Vokabel, Lektion, Kasten, Übungsliste, Einstellungen
  screens/            Ansichten (Start, Lektionen, Scannen, Lernen, …)
  services/           Benachrichtigungen, Foto + Teilen mit der KI-App
  utils/              FSRS, Wiederholungs-Planung, KI-Anleitung, Ziele
```
