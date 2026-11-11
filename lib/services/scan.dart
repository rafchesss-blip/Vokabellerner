import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

const _channel = MethodChannel('vokabeltrainer/ai');

/// Eine KI-App für die Auswahl beim Scannen.
class AiApp {
  final String package;
  final String name;
  final Uint8List icon;

  /// Nicht installiert – wird zum Installieren angeboten.
  final bool missing;

  const AiApp(this.package, this.name, this.icon, {this.missing = false});
}

/// Foto aufnehmen bzw. auswählen (`null` bei Abbruch).
Future<XFile?> pickVocabPhoto({required bool camera}) => ImagePicker().pickImage(
      source: camera ? ImageSource.camera : ImageSource.gallery,
      // Kleiner reicht für Text und geht schneller an die KI.
      maxWidth: 2400,
      maxHeight: 2400,
      imageQuality: 85,
    );

/// KI-Apps auf dem Handy (ChatGPT und Gemini auch, wenn sie fehlen).
Future<List<AiApp>> aiApps() async {
  final list = await _channel.invokeListMethod<Map>('installedApps') ?? [];
  return [
    for (final m in list)
      AiApp(
        m['package'] as String,
        m['name'] as String,
        m['icon'] as Uint8List,
        missing: m['missing'] as bool? ?? false,
      ),
  ];
}

/// Öffnet [app] direkt mit Foto und Anleitung. Die Anleitung liegt
/// zusätzlich in der Zwischenablage – falls die App den Text nicht
/// übernimmt, lässt er sich einfügen.
Future<bool> sendToAi(AiApp app, XFile photo, String prompt) async {
  await Clipboard.setData(ClipboardData(text: prompt));
  return await _channel.invokeMethod<bool>('share', {
        'package': app.package,
        'image': photo.path,
        'text': prompt,
      }) ??
      false;
}

/// Öffnet [app] im Play Store.
Future<void> installAiApp(AiApp app) =>
    _channel.invokeMethod('openStore', {'package': app.package});

/// Text aus der Zwischenablage (oder `null`).
Future<String?> readClipboard() async =>
    (await Clipboard.getData(Clipboard.kTextPlain))?.text;

/// Leert die Zwischenablage, damit dieselbe Antwort nicht zweimal
/// übernommen wird.
Future<void> clearClipboard() =>
    Clipboard.setData(const ClipboardData(text: ''));
