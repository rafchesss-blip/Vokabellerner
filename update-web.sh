#!/usr/bin/env bash
# Update-Skript für die Web-Version des Vokabellerners
# Baut die App neu und packt sie als ZIP für Netlify.
set -e
cd "$(dirname "$0")"

echo "==> Baue Web-Version (Release)..."
flutter build web --release

echo "==> Erstelle ZIP-Datei..."
rm -f vokabellerner-web.zip
(cd build/web && zip -r -q ../../vokabellerner-web.zip .)

echo "==> Fertig! ✅"
echo "    vokabellerner-web.zip wurde aktualisiert."
echo "    Lade sie auf Netlify hoch (Drag & Drop), um das Update zu veröffentlichen."
