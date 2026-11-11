import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

/// Foto aufnehmen bzw. auswählen (`null` bei Abbruch).
Future<XFile?> pickVocabPhoto({required bool camera}) => ImagePicker().pickImage(
      source: camera ? ImageSource.camera : ImageSource.gallery,
      // Kleiner reicht für Text und geht schneller an die KI.
      maxWidth: 2400,
      maxHeight: 2400,
      imageQuality: 85,
    );

/// Schickt Foto und Anleitung an eine KI-App. Android fragt, mit welcher
/// App („Teilen mit …"). Die Anleitung liegt zusätzlich in der
/// Zwischenablage – manche Apps übernehmen beim Teilen nur das Bild.
Future<void> sendToAi(XFile photo, String prompt) async {
  await Clipboard.setData(ClipboardData(text: prompt));
  await SharePlus.instance.share(ShareParams(
    text: prompt,
    files: [photo],
    title: 'Vokabeln mit KI ablesen',
  ));
}

/// Text aus der Zwischenablage (oder `null`).
Future<String?> readClipboard() async =>
    (await Clipboard.getData(Clipboard.kTextPlain))?.text;

/// Leert die Zwischenablage, damit dieselbe Antwort nicht zweimal
/// übernommen wird.
Future<void> clearClipboard() =>
    Clipboard.setData(const ClipboardData(text: ''));
