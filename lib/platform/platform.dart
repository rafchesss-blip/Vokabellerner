/// Plattform-Funktionen (Browser vs. Handy) hinter einer gemeinsamen API.
library;

export 'platform_stub.dart' if (dart.library.js_interop) 'platform_web.dart';
