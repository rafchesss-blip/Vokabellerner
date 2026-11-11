/// Plattform-Funktionen (Browser vs. Handy) hinter einer gemeinsamen API.
library;

export 'platform_stub.dart' if (dart.library.js_interop) 'platform_web.dart';

/// Neueste Android-App (als Datei an das neueste GitHub-Release gehängt).
const apkUrl = 'https://github.com/rafchesss-blip/Vokabellerner/releases/'
    'latest/download/Vokabellerner.apk';
