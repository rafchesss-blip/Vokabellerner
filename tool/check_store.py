"""Prüft die Store-Texte (store/<sprache>.md) auf die Längen von Google Play.

Aufruf: python tool/check_store.py
"""
import glob, re

LIMITS = {'Titel': 30, 'Kurzbeschreibung': 80, 'Beschreibung': 4000}

ok = True
for path in sorted(glob.glob('store/*.md')):
    text = open(path, encoding='utf-8').read()
    parts = re.split(r'^# (.+)$', text, flags=re.M)[1:]
    sections = dict(zip(parts[0::2], (p.strip() for p in parts[1::2])))
    if len(sections) != 3:
        print(f'{path}: erwartet 3 Abschnitte, gefunden {len(sections)}')
        ok = False
        continue
    lengths = []
    for (heading, body), (name, limit) in zip(sections.items(), LIMITS.items()):
        n = len(body)
        lengths.append(f'{name} {n}/{limit}')
        if n > limit or n == 0:
            print(f'{path}: {name} hat {n} Zeichen (max. {limit})')
            ok = False
    print(f'{path}: ' + ', '.join(lengths))
print('OK' if ok else 'FEHLER')
