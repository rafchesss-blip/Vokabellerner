import 'dart:async';
import 'dart:js_interop';

import 'package:web/web.dart' as web;

/// Ob Dateien heruntergeladen/hochgeladen werden können.
const bool supportsFiles = true;

/// Bittet den Browser, den Speicher dieser Seite nicht automatisch zu
/// leeren (z. B. wenn der Speicherplatz knapp wird).
void requestPersistentStorage() {
  try {
    web.window.navigator.storage.persist();
  } catch (_) {
    // Älterer Browser – nicht schlimm.
  }
}

/// Bietet [content] als Datei [fileName] zum Herunterladen an.
Future<bool> saveTextFile(String fileName, String content) async {
  final blob = web.Blob(
    [content.toJS].toJS,
    web.BlobPropertyBag(type: 'application/json'),
  );
  final url = web.URL.createObjectURL(blob);
  final anchor = web.HTMLAnchorElement()
    ..href = url
    ..download = fileName;
  web.document.body!.append(anchor);
  anchor.click();
  anchor.remove();
  // Etwas warten, damit der Download sicher gestartet ist.
  Timer(const Duration(seconds: 5), () => web.URL.revokeObjectURL(url));
  return true;
}

/// Öffnet den Dateidialog und liefert den Inhalt der gewählten Datei
/// (`null` bei Abbruch).
Future<String?> pickTextFile() {
  final completer = Completer<String?>();
  final input = web.HTMLInputElement()
    ..type = 'file'
    ..accept = '.json,application/json';

  input.onChange.listen((_) async {
    final file = input.files?.item(0);
    if (file == null) {
      if (!completer.isCompleted) completer.complete(null);
      return;
    }
    final text = (await file.text().toDart).toDart;
    if (!completer.isCompleted) completer.complete(text);
  });
  const web.EventStreamProvider<web.Event>('cancel')
      .forTarget(input)
      .listen((_) {
    if (!completer.isCompleted) completer.complete(null);
  });

  input.click();
  return completer.future;
}
