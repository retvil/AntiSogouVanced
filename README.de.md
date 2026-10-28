# AntiSogou Vanced

**🇬🇧 English** | [🇷🇺 Русский](docs/lang_icons/ru.png) | ...

[![Release](https://img.shields.io/github/v/release/retvil/AntiSogouVanced?sort=date)](https://github.com/retvil/AntiSogouVanced/releases) [![Platform Windows](https://img.shields.io/badge/platform-Windows-blue)](https://github.com/retvil/AntiSogouVanced/releases) [![Python](https://img.shields.io/badge/python-3.10%2B-blue)](https://www.python.org/)

**Sogou Browser vollständig entfernen und die Standardsuche hart gegen Entführung sichern — 28 Erkennungsvektoren (VANCED) / 39 Erkennungsvektoren (EXTENDED), 10 Suchmaschinen, 10 UI-Sprachen.**

[🇬🇧 English](README.md) | [🇷🇺 Русский](README.ru.md) | [🇺🇦 Українська](README.uk.md) | [🇰🇿 Қазақша](README.kk.md) | **🇩🇪 Deutsch** | [🇫🇷 Français](README.fr.md) | [🇪🇸 Español](README.es.md) | [🇵🇱 Polski](README.pl.md) | [🇹🇷 Türkçe](README.tr.md) | [🇨🇳 中文](README.zh.md)

## Was ist das?

Sogou installiert nicht nur einen Browser — es trägt sich still über vierzig Systemmechanismen als Standardsuche und Standardbrowser ein: Registry-Assoziationen, Enterprise-Richtlinien, Profileinstellungen von Browsern, sogar Suchmaschinen-Datenbanken in Chromium-Profilen. Allein das Entfernen des Browsers macht das nicht rückgängig.

**AntiSogou Vanced** (ein Fork von [TheCawa/AntiYandex](https://github.com/TheCawa/AntiYandex)) findet **alle 28/39 Hijack-Vektoren**, entfernt sie mit einem Klick und **verriegelt dann Ihre Standardsuche** hart auf eine von Ihnen gewählte Suchmaschine über Windows-Enterprise-Richtlinien — damit nichts sie laut zurückholen kann.

## Funktionen

- **Hijack-Scanner** — erkennt 28 Vektoren (VANCED) / 39 Vektoren (EXTENDED): Installationspfade, Uninstall-Registry-Einträge, `UserChoice`-Assoziation, `StartMenuInternet`-Registrierungen, `Software\Sogou`-Schlüsselbäume, Hijack über `DefaultSearchProvider*`-Richtlinien, Chromium-Profil-`Preferences`, Schlüsselwörter in `Web Data` (SQLite), Firefox `search.json.mozlz4`, Legacy-`SearchScopes`, Autostart-Einträge, geplante Aufgaben, Windows-Dienste, IME Switcher, Dateizuordnungen, Sogou-Disk-Shell-Integration, deaktivierter Autostart, App Paths, Verknüpfungen, ProgramData/Roaming-Reste, hosts-Einträge, Firewall-Regeln, URI-Protokolle, Browser-Erweiterungen, sogou.ru-Cookies, „Öffnen mit“-Zuordnungen, Prefetch/WER-Spuren, Defender-Ausschlüsse, Tastaturlayouts, IE-Startseiten-Hijack, Richtlinien für Start-URLs (`RestoreOnStartupURLs`), Firefox-Startseite, IE-Zonemap, RegisteredApplications-Einträge, MUICache-Spuren, %TEMP%-Installer, Store-Apps (Sogou Music), Produktverzeichnisse, lokale Datenverzeichnisse, Sogou.DNS
- **Entfernung mit einem Klick** — jeder Vektor hat seinen eigenen Remover; gesperrte Datenbanken werden ehrlich gemeldet, ohne Abstürze
- **Harte Suchrichtlinie** — verriegelt die Standardsuche auf eine von 10 Suchmaschinen (Google, Bing, DuckDuckGo, Brave Search, Startpage, Mojeek, Qwant, Ecosia, Yahoo, SearXNG) über HKLM-Richtlinien für Chrome, Edge, Brave, Vivaldi, Opera und Sogou Browser + `policies.json` für Firefox/Waterfox
- **Richtlinien-Bereinigung** — entfernt Sogou-`DefaultSearchProvider*`-Werte aus der Registry
- **10 UI-Sprachen** — ru, en, uk, kk, de, fr, es, pl, tr, zh; Systemsprache wird automatisch erkannt
- **Leichtes UI** — ttkbootstrap, vertikales Layout, fixierte Statusleiste und Fußzeile

## Screenshot

<details>
<summary>Hauptfenster</summary>

![AntiSogouVanced Hauptfenster](docs/screenshot.png)

</details>

## Fertige Builds

Download von [Releases](https://github.com/retvil/AntiSogouVanced/releases):

- **Windows** — `AntiSogouVanced.exe` (portabel, eine Datei, ~35 MB) — entfernt Sogou Browser und die Sogou-Suche
- **Windows** — `AntiSogouExtended.exe` (portabel, eine Datei, ~35 MB) — Entfernung aller Sogou-Produkte (Sogou Disk, ime-Switcher-Verlauf, systemweite Spuren, Store-Apps, Sogou.DNS)

Als **Administrator ausführen** — HKLM-Richtlinien und Registry-Bereinigung erfordern erhöhte Rechte.

## Installation aus dem Quellcode

Python 3.10+ erforderlich ([python.org](https://python.org)).

```bash
git clone https://github.com/retvil/AntiSogouVanced.git
cd AntiSogouVanced
pip install psutil ttkbootstrap
python main.py
```

Eigenes EXE bauen: `build.bat` ausführen (PyInstaller, Ergebnis in `dist/`).

## Verwendung

1. **Prozesse beenden** → **Sogou suchen** → **Sogou löschen** — den Browser selbst entfernen.
2. **Such-Hijacks scannen** — zeigt alle Wege, wie Sogou sich ins System eingegraben hat.
3. **Hijacks entfernen** — zuerst alle Browser schließen, dann alles Gefundene entfernen.
4. Suchmaschine wählen → **Richtlinie anwenden** — die Standardsuche ist auf Systemebene verriegelt.

## FAQ

- **Warum Administrator?** Suchrichtlinien liegen in HKLM, die Hijack-Bereinigung berührt die System-Registry — erhöhte Rechte nötig.
- **„Database locked" in den Ergebnissen?** Während der Bereinigung lief ein Chromium-Browser. Alle Browser schließen und die Entfernung wiederholen.
- **Wie entferne ich die Suchrichtlinie?** Die Schaltfläche **Sogou-Richtlinien entfernen** räumt die Richtlinienwerte weg; in Firefox kann man zusätzlich die Datei `distribution\policies.json` löschen.

## Autor & Support

**Nod33Eset** — Fork von [TheCawa/AntiYandex](https://github.com/TheCawa/AntiYandex). Issues und PRs sind willkommen.

Wenn dich das Tool von Sogou befreit hat, kannst du die Entwicklung unterstützen:

**Krypto:**

- BTC: `bc1qunld3rsp37qf5gg69aune50y0qqkd0eugg7j97`
- TON: `UQDmvr4SKOxSION3Yky6aOgzAnCDXySPuAbG4EKJa5JUT7tC`
- USDT (TRC20): `TBPJSSLu1mUcX54g9UyxUohYGf2fuRvbwd`
- USDT (ERC20): `0x25CAED3776Ef5b18E03392bC5b254Bbd78E8180C`
- USDT (SOL): `3qgN5z291CEcj2FUi2Zza5DioxKgNw72kC7P52pCcTrG`

## Lizenz

MIT — siehe [LICENSE](LICENSE).



