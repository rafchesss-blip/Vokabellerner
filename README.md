# Vokabellerner – Latein

Ein Latein-Vokabeltrainer als Flutter-App. Er läuft komplett im Browser
(GitHub Pages), ohne Konto und ohne Server. Der Lernfortschritt wird im
Browser gespeichert.

**App öffnen:** https://rafchesss-blip.github.io/Vokabellerner/

## Funktionen

- **Startseite „Heute“:** zeigt fällige Wiederholungen und neue Vokabeln.
  Ein Tipp auf „Los geht's“ startet die Runde. Dazu gibt es eine Lernserie
  (🔥 Tage in Folge) und eine Tagesstatistik.
- **Spaced Repetition mit FSRS-6:** derselbe Algorithmus wie in Anki
  (`lib/utils/fsrs.dart`). Jede Vokabel hat eine Stabilität und eine
  Schwierigkeit, daraus berechnet die App den nächsten Termin. Ziel ist,
  dass du dich an 90 % erinnerst. Pro Runde kommen höchstens 15 neue
  Vokabeln dazu.
- **Karteikarten:** Die Karte dreht sich um, du bewertest mit Nochmal, Schwer,
  Gut oder Leicht und siehst vorher, wann die Karte wiederkommt.
  Am PC: Leertaste zum Umdrehen, 1–4 zum Bewerten.
- **Test-Modus:** Du tippst die Übersetzung und/oder die mittlere Spalte ein.
  Die Prüfung ignoriert Makronen (ā = a) und Artikel.
- **Übungslisten mit Testdatum:** Bis zum Testtag wird alles noch einmal
  wiederholt.
- **Lektionen:** Die Lektionen sind eingebaut. Zusätzlich kann jeder eigene
  Lektionen einfügen (Text hineinkopieren). Eine ganze Lektion lässt sich
  direkt üben.
- **Analyse:** Jede Vokabel hat eine Lernstufe (−5 bis +5) mit Verlauf.
  Außerdem siehst du, wie gut du sie gerade noch weißt und wann sie wieder
  drankommt.
- **Sicherung:** Unter Einstellungen → Daten & Sicherung exportierst du eine
  Datei und importierst sie wieder, auch auf einem anderen Gerät.

## Neue Lektion für alle hinzufügen

Die eingebauten Lektionen sind einfache Textdateien im Ordner
[`lektionen/`](lektionen/).

1. Öffne auf GitHub den Ordner `lektionen` und klicke auf **Add file →
   Create new file**.
2. Gib als Namen z. B. `lektion-05.txt` ein.
3. Schreib die Lektion in diesem Format:

   ```
   Lektion 5

   Kasten 1
   luna | f | der Mond
   stella | f | der Stern
   et | und

   Kasten 2
   vocāre | vocō | rufen, nennen
   ```

   Pro Zeile steht `Latein | mittlere Spalte | Deutsch`. Die mittlere Spalte
   kann wegfallen (`et | und`). Zeilen mit `#` am Anfang sind Kommentare.
4. Klicke auf **Commit changes**. Nach etwa 2–3 Minuten ist die Lektion
   in der App, bei allen Nutzern.

Tippfehler korrigierst du genauso direkt in der Datei. Der Lernfortschritt
hängt am Dateinamen und am Wort. Ändert sich ein Wort, beginnt es wieder als
„neu“.

Tipp: In der App unter **Lektionen → Eigene Lektion** kannst du eine Lektion
einfügen und mit „Für alle: als Datei für GitHub kopieren“ direkt im
richtigen Format kopieren.

## Entwickeln

```bash
flutter pub get
flutter run -d chrome     # im Browser starten
flutter test              # Tests
```

Bei jedem Push auf `main` testet GitHub Actions die App, baut sie und
veröffentlicht sie auf GitHub Pages (`.github/workflows/deploy.yml`).

Für eine Android-APK (`flutter create .`, dann `flutter build apk`) gibt es
statt Datei-Download und -Upload die Zwischenablage für Sicherungen.

## Aufbau

```
lektionen/            eingebaute Lektionen (eine .txt pro Lektion)
lib/
  data/               Speicher (shared_preferences) + Laden der Lektionen
  models/             Vokabel, Lektion, Kasten, Übungsliste, Einstellungen
  screens/            Ansichten (Start, Lektionen, Analyse, Lernen, …)
  utils/              FSRS, Wiederholungs-Planung, Parser, Ziele
  platform/           Browser-Funktionen (Datei-Download/-Upload)
```
