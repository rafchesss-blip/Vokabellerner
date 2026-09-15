import 'package:flutter/material.dart';

import '../data/store.dart';
import '../services/auth.dart';
import '../theme/app_theme.dart';

/// Anmelde- und Registrierungsbildschirm.
///
/// Nach erfolgreicher Anmeldung wechselt die App automatisch zum
/// Hauptbildschirm (gesteuert über `AuthService.revision`).
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _register = false;
  bool _busy = false;
  String? _error;

  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final name = _name.text.trim();
    final password = _password.text;

    if (name.isEmpty || password.isEmpty) {
      setState(() => _error = 'Bitte Benutzername und Passwort eingeben.');
      return;
    }

    setState(() {
      _busy = true;
      _error = null;
    });

    try {
      if (_register) {
        await AuthService.instance.register(name, password);
        // Neues Konto: die lokal vorhandenen Lektionen in die Cloud legen.
        await Store.instance.pushToCloud();
      } else {
        await AuthService.instance.login(name, password);
        // Bestehendes Konto: Daten aus der Cloud laden.
        await Store.instance.pullFromCloud();
      }
    } catch (e) {
      if (mounted) setState(() => _error = e.toString());
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.menu_book,
                    size: 64,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Vokabellerner',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Latein-Vokabeltrainer',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: muted(context)),
                  ),
                  const SizedBox(height: 24),
                  SegmentedButton<bool>(
                    segments: const [
                      ButtonSegment(
                        value: false,
                        label: Text('Anmelden'),
                        icon: Icon(Icons.login),
                      ),
                      ButtonSegment(
                        value: true,
                        label: Text('Registrieren'),
                        icon: Icon(Icons.person_add_outlined),
                      ),
                    ],
                    selected: {_register},
                    onSelectionChanged: (s) => setState(() {
                      _register = s.first;
                      _error = null;
                    }),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _name,
                    autofocus: true,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      labelText: 'Benutzername',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                    onSubmitted: (_) => _submit(),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _password,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Passwort',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                    onSubmitted: (_) => _submit(),
                  ),
                  if (_error != null) ...[
                    const SizedBox(height: 12),
                    Text(
                      _error!,
                      style: TextStyle(color: colorScheme.error),
                    ),
                  ],
                  const SizedBox(height: 20),
                  FilledButton(
                    onPressed: _busy ? null : _submit,
                    child: _busy
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(_register ? 'Konto erstellen' : 'Anmelden'),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _register
                        ? 'Deine Listen und Fortschritte werden mit deinem '
                            'Konto gespeichert.'
                        : 'Noch kein Konto? Wechsle oben zu „Registrieren".',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: muted(context), fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
