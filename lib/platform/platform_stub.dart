// Außerhalb des Browsers gibt es (ohne Zusatzpakete) keinen Dateidialog –
// die Aufrufer weichen dann auf die Zwischenablage aus.

/// Ob Dateien heruntergeladen/hochgeladen werden können.
const bool supportsFiles = false;

void requestPersistentStorage() {}

Future<bool> saveTextFile(String fileName, String content) async => false;

Future<String?> pickTextFile() async => null;
