"""Erzeugt die Grafiken für den Google-Play-Eintrag.

Aufruf: python tool/store_graphics.py
Ergebnis in store/:
  icon-512.png                 App-Symbol 512 × 512 (ohne Rundung – Google
                               rundet selbst)
  feature-graphic-<code>.png   Titelbild 1024 × 500 pro Sprache
"""
import os

from PIL import Image, ImageDraw, ImageFilter, ImageFont

os.makedirs('store', exist_ok=True)
FONTS = r'C:\Windows\Fonts'

# Farben wie im App-Symbol: Violett oben links → Türkis unten rechts.
TOP_LEFT = (139, 92, 246)
BOTTOM_RIGHT = (34, 211, 238)

# Name und Untertitel pro Sprache (Name wie unter dem App-Symbol).
TEXTS = {
    'de': ('Vokabeltrainer', 'Vokabeln eintippen oder einfach scannen'),
    'en': ('Vocab Trainer', 'Type your vocabulary – or just scan it'),
    'es': ('Vocabulario', 'Escribe tu vocabulario o escanéalo'),
    'fr': ('Vocabulaire', 'Tape ton vocabulaire ou scanne-le'),
    'it': ('Vocaboli', 'Scrivi i tuoi vocaboli o scansionali'),
    'pt': ('Vocabulário', 'Digite seu vocabulário ou escaneie'),
    'pl': ('Słówka', 'Wpisz słówka albo po prostu je zeskanuj'),
    'tr': ('Kelime Öğren', 'Kelimeleri yaz ya da tara'),
    'ru': ('Словарик', 'Вводи слова или просто сканируй'),
    'zh': ('背单词', '输入单词，或直接扫描'),
}


def gradient(w, h):
    img = Image.new('RGB', (w, h))
    px = img.load()
    for y in range(h):
        for x in range(w):
            t = (x / w + y / h) / 2
            px[x, y] = tuple(
                round(a + (b - a) * t) for a, b in zip(TOP_LEFT, BOTTOM_RIGHT))
    return img


def font(name, size):
    return ImageFont.truetype(os.path.join(FONTS, name), size)


def draw_v(img, center, size):
    """Weißes Serifen-V mit weichem Schatten, wie im App-Symbol."""
    f = font('timesbd.ttf', size)
    shadow = Image.new('RGBA', img.size, (0, 0, 0, 0))
    d = ImageDraw.Draw(shadow)
    offset = size // 40
    d.text((center[0] + offset, center[1] + offset), 'V', font=f,
           fill=(40, 30, 90, 110), anchor='mm')
    shadow = shadow.filter(ImageFilter.GaussianBlur(size // 60))
    img.paste(shadow, (0, 0), shadow)
    ImageDraw.Draw(img).text(center, 'V', font=f, fill='white', anchor='mm')


# ── App-Symbol ───────────────────────────────────────────────────────────
icon = gradient(512, 512).convert('RGBA')
draw_v(icon, (256, 262), 360)
icon.convert('RGB').save('store/icon-512.png')

# ── Titelbilder ──────────────────────────────────────────────────────────
for code, (name, tagline) in TEXTS.items():
    img = gradient(1024, 500).convert('RGBA')

    # Symbol links als weiße Kachel mit dem V.
    tile = gradient(220, 220).convert('RGBA')
    draw_v(tile, (110, 114), 160)
    mask = Image.new('L', (220, 220), 0)
    ImageDraw.Draw(mask).rounded_rectangle((0, 0, 219, 219), 48, fill=255)
    glow = Image.new('RGBA', img.size, (0, 0, 0, 0))
    ImageDraw.Draw(glow).rounded_rectangle(
        (92, 148, 92 + 220, 148 + 220), 48, fill=(30, 20, 80, 90))
    img.alpha_composite(glow.filter(ImageFilter.GaussianBlur(18)))
    ImageDraw.Draw(img).rounded_rectangle(
        (80, 140, 80 + 220, 140 + 220), 48, outline=(255, 255, 255, 230),
        width=6)
    img.paste(tile, (80, 140), mask)

    bold, regular = (('msyhbd.ttc', 'msyh.ttc') if code == 'zh'
                     else ('segoeuib.ttf', 'segoeui.ttf'))
    d = ImageDraw.Draw(img)
    x = 350
    size = 84
    while d.textlength(name, font=font(bold, size)) > 1024 - x - 50:
        size -= 4
    d.text((x, 228), name, font=font(bold, size), fill='white', anchor='ls')
    size = 36
    while d.textlength(tagline, font=font(regular, size)) > 1024 - x - 50:
        size -= 2
    d.text((x, 292), tagline, font=font(regular, size),
           fill=(255, 255, 255, 235), anchor='ls')
    img.convert('RGB').save(f'store/feature-graphic-{code}.png')

print('fertig:', sorted(os.listdir('store')))
