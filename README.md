# Latein-Vokabeltrainer

Eine Flutter-App zum Lernen lateinischer Vokabeln.

## Struktur

Die Vokabeln sind dreistufig aufgebaut:

```
Lektion → Kasten → Vokabel
```

Jede Vokabel besteht aus drei Spalten:

| Spalte | Inhalt |
|---|---|
| Latein | das lateinische Wort (z. B. `mūrus`) |
| Mittlere Spalte | Formen des lateinischen Wortes (z. B. `mūrī m`) – optional |
| Deutsch | die Übersetzung (z. B. `die Mauer`) |

Zusätzlich gibt es **Übungslisten**: benannte Sammlungen von Vokabeln, die
du selbst zusammenstellst (z. B. „Vokabeltest 1").

## Funktionen

- **Dashboard:** Übersicht (Lektionen, Übungslisten, Vokabeln) und
  „Lernen starten".
- **Übungslisten:** Listen erstellen (Name → Vokabeln auswählen), üben,
  über das Drei-Punkte-Menü bearbeiten (Vokabeln hinzufügen/entfernen)
  oder löschen.
- **Zwei Lern-Modi** (nach Listen-Auswahl):
  - *Karteikarten:* Wort anzeigen → „Bedeutung anzeigen" → Richtig/Falsch.
    Mit Filter „Alle" / „Nur schwache".
  - *Test:* Wort anzeigen, Übersetzung und/oder mittlere Spalte eintippen.
- **Analyse:** Übungsliste auswählen → Vokabeln nach Lernstufe sortiert
  (11 Stufen: 5 grün, 1 grau, 5 rot). Antippen zeigt eine Verlaufs-Grafik
  und erlaubt das manuelle Verbessern/Verschlechtern mit +/−.
- **Einstellungen:** Sprachrichtung und Abfrage-Modus (nur Übersetzung /
  nur mittlere Spalte / beides).
- **Überall erreichbar:** Home-Button (zum Dashboard) und Einstellungen
  oben in jeder Ansicht.

Die Prüfung ist **makronentolerant** (ā = a) und **artikeltolerant**
(der/die/das/ein/eine sind optional). Alles wird lokal gespeichert.

## Einrichtung

Flutter installieren, dann im Projektordner:

```bash
flutter create .       # erzeugt Android/iOS-Ordner (überschreibt nichts)
flutter pub get
flutter run            # z. B. auf einem angeschlossenen Handy/Emulator
```

Beim ersten Start ist **Lektion 18** (5 Kästen, 43 Vokabeln) angelegt.
