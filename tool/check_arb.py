"""Prüft eine Übersetzung gegen die deutsche Vorlage.

Aufruf: python tool/check_arb.py lib/l10n/app_en.arb
Meldet fehlende/überzählige Schlüssel, fehlende Platzhalter und kaputtes
ICU (plural/select) – „OK“, wenn alles passt.
"""
import json, re, sys

base = json.load(open('lib/l10n/app_de.arb', encoding='utf-8'))
path = sys.argv[1]
try:
    tr = json.load(open(path, encoding='utf-8'))
except Exception as e:
    sys.exit(f'Kein gültiges JSON: {e}')

keys = {k for k in base if not k.startswith('@')}
tkeys = {k for k in tr if not k.startswith('@')}
errors = []
for k in sorted(keys - tkeys):
    errors.append(f'fehlt: {k}')
for k in sorted(tkeys - keys):
    errors.append(f'unbekannt: {k}')
if tr.get('@@locale') in (None, 'de'):
    errors.append('"@@locale" fehlt oder ist "de"')

def placeholders(s):
    # Platzhalter auf oberster Ebene und in ICU-Zweigen: {name}
    # Nur ASCII-Namen – chinesischer Text in {…} ist kein Platzhalter.
    name = r'([A-Za-z_][A-Za-z0-9_]*)'
    return set(re.findall(r'\{' + name + r'\}', s)) | set(re.findall(r'\{' + name + ',', s))

def balanced(s):
    depth = 0
    for c in s:
        depth += c == '{'
        depth -= c == '}'
        if depth < 0:
            return False
    return depth == 0

for k in sorted(keys & tkeys):
    b, t = base[k], tr[k]
    if not isinstance(t, str) or not t.strip():
        errors.append(f'leer: {k}')
        continue
    if not balanced(t):
        errors.append(f'Klammern {{}} unausgeglichen: {k}')
    if placeholders(b) != placeholders(t):
        errors.append(f'Platzhalter {sorted(placeholders(b))} ≠ {sorted(placeholders(t))}: {k}')
    for kind in ('plural', 'select'):
        icu = re.compile(r'\{\s*\w+\s*,\s*' + kind + r'\s*,')
        if bool(icu.search(b)) != bool(icu.search(t)):
            errors.append(f'{kind} fehlt/zu viel: {k}')
    if re.search(r'\{\s*\w+\s*,\s*plural\s*,', t) and 'other{' not in t.replace(' ', ''):
        errors.append(f'plural ohne other: {k}')

print('\n'.join(errors) if errors else f'OK ({len(tkeys)} Texte)')
sys.exit(1 if errors else 0)
