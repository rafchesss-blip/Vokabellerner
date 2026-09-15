import 'package:flutter/material.dart';

import '../services/api.dart';
import '../services/auth.dart';
import '../theme/app_theme.dart';
import 'lesson_editor_screen.dart';

/// Admin-Bereich: alle Konten sehen, einsehen und löschen sowie neue
/// Lektionen für alle Nutzer hinzufügen.
class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

enum _AdminSection { accounts, lessons }

class _AdminScreenState extends State<AdminScreen> {
  _AdminSection _section = _AdminSection.accounts;

  List<String> _users = [];
  bool _loading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final users = await Api.adminListUsers(AuthService.instance.token!);
      users.sort();
      if (mounted) setState(() => _users = users);
    } catch (e) {
      if (mounted) setState(() => _error = e.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _deleteUser(String username) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('„$username" löschen?'),
        content: const Text(
          'Das Konto und alle seine Daten werden unwiderruflich gelöscht.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Abbrechen'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Löschen'),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;

    try {
      await Api.adminDeleteUser(AuthService.instance.token!, username);
      if (mounted) {
        setState(() => _users.remove(username));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('„$username" wurde gelöscht.')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  Future<void> _showUser(String username) async {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => AlertDialog(
        title: Text(username),
        content: FutureBuilder<Map<String, dynamic>>(
          future: Api.adminGetUserData(AuthService.instance.token!, username),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const SizedBox(
                height: 80,
                child: Center(child: CircularProgressIndicator()),
              );
            }
            if (snapshot.hasError) {
              return Text('Fehler: ${snapshot.error}');
            }
            final data = snapshot.data!;
            final lessons =
                (data['lessons'] as List? ?? []).cast<Map<String, dynamic>>();
            final lists =
                (data['lists'] as List? ?? []).cast<Map<String, dynamic>>();

            final vocabCount = lessons.fold<int>(
              0,
              (sum, l) =>
                  sum +
                  (l['boxes'] as List? ?? []).fold<int>(
                    0,
                    (s, b) => s + ((b as Map)['vocabs'] as List? ?? []).length,
                  ),
            );

            final listNames =
                lists.map((l) => (l['name'] as String?) ?? 'Unbenannt').toList();

            return SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${lessons.length} Lektionen · $vocabCount Vokabeln'),
                  const SizedBox(height: 4),
                  Text('${lists.length} Übungslisten'),
                  if (listNames.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    for (final n in listNames) Text('• $n'),
                  ],
                ],
              ),
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Schließen'),
          ),
        ],
      ),
    );
  }

  Future<void> _addLesson() async {
    final created = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => const LessonEditorScreen()),
    );
    if (created == true && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Lektion gespeichert. Sie wird bei allen Konten automatisch ergänzt.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: SegmentedButton<_AdminSection>(
            segments: const [
              ButtonSegment(
                value: _AdminSection.accounts,
                label: Text('Accounts'),
                icon: Icon(Icons.people_outline),
              ),
              ButtonSegment(
                value: _AdminSection.lessons,
                label: Text('Lektionen'),
                icon: Icon(Icons.library_add_outlined),
              ),
            ],
            selected: {_section},
            onSelectionChanged: (s) =>
                setState(() => _section = s.first),
          ),
        ),
        Expanded(
          child: _section == _AdminSection.accounts
              ? _buildAccounts()
              : _buildLessons(),
        ),
      ],
    );
  }

  Widget _buildAccounts() {
    if (_loading && _users.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null && _users.isEmpty) {
      return _Message(
        icon: Icons.error_outline,
        message: _error!,
        action: OutlinedButton(
          onPressed: _loadUsers,
          child: const Text('Erneut versuchen'),
        ),
      );
    }

    if (_users.isEmpty) {
      return const _Message(
        icon: Icons.people_outline,
        message: 'Noch keine Konten registriert.',
      );
    }

    return RefreshIndicator(
      onRefresh: _loadUsers,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        itemCount: _users.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, i) {
          final username = _users[i];
          return Card(
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person_outline)),
              title: Text(
                username,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              trailing: IconButton(
                tooltip: 'Löschen',
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                onPressed: () => _deleteUser(username),
              ),
              onTap: () => _showUser(username),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLessons() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      children: [
        Card(
          elevation: 0,
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Neue Lektion für alle Konten',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  'Füge eine Lektion im bekannten Format hinzu (Kästen mit '
                  'Latein / Mittlere Spalte / Übersetzung). Sie wird bei '
                  'allen bestehenden und neuen Konten automatisch ergänzt.',
                  style: TextStyle(color: muted(context)),
                ),
                const SizedBox(height: 12),
                FilledButton.icon(
                  onPressed: _addLesson,
                  icon: const Icon(Icons.add),
                  label: const Text('Lektion hinzufügen'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Message extends StatelessWidget {
  final IconData icon;
  final String message;
  final Widget? action;

  const _Message({required this.icon, required this.message, this.action});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 64, color: faint(context)),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(color: muted(context)),
            ),
            if (action != null) ...[const SizedBox(height: 12), action!],
          ],
        ),
      ),
    );
  }
}
