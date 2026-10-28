# Änderungsprotokoll

Alle wesentlichen Änderungen an diesem Projekt werden in dieser Datei dokumentiert.

Das Format basiert auf [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
und dieses Projekt folgt [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

> Die englische [CHANGELOG.md](CHANGELOG.md) ist die maßgebliche Quelle; diese Übersetzung kann leicht hinterherhinken.

## [1.1.0] - 2026-10-22

### Hinzugefügt
- **IE-Zonemap-Scan** — findet Zonemap-Einträge für Sogou-Domains
  (Rückstände „vertrauenswürdiger Sites“); die Entfernung löscht den
  Domain-Unterbaum (zuerst exportiert)
- **RegisteredApplications-Scan** — findet Sogou-Einträge in den
  Metadaten der Standard-Apps; die Entfernung löscht den Wert (zuerst
  exportiert)
- **MUICache-Scan** — findet Ausführungsspuren von Sogou-Programmen;
  die Entfernung löscht den Cache-Wert (zuerst exportiert)
- **%TEMP%-Installer-Spuren** — scan_traces meldet jetzt auch
  Sogou-Installer, die im temporären Benutzerverzeichnis zurückgeblieben sind
- **Per-User-Produktverzeichnisse** — scan_product_dirs deckt jetzt auch
  `%LOCALAPPDATA%\Programs\Sogou*` ab (Legacy-Installationen von Sogou
  Music / Messenger / Translate), Browser-Ordner ausgeschlossen
- **Prozess-Kill nach Pfad (Vanced)** — der browserbezogene Kill erfasst
  jetzt auch Prozesse, deren EXE unter einem SogouBrowser-Pfad liegt
  (crashpad, updater), nicht nur die enge Liste browser.exe/sogou.exe
- **Scan für Start-URL-Hijack** — findet Sogou-URLs in den
  `RestoreOnStartupURLs`-Enterprise-Richtlinien (Edge, Chrome, Chromium,
  Brave, Vivaldi, Opera, Sogou Browser); die Entfernung streicht die
  Sogou-Werte
- **Scan für Firefox-Startseiten-Hijack** — findet `browser.startup.homepage`
  mit Verweis auf Sogou in der `prefs.js` von Firefox/Waterfox; die
  Entfernung schreibt die Datei neu (zuerst Backup)

## [2.7.0] - 2026-10-21

### Hinzugefügt
- **Sogou.DNS-Scan** (Extended) — findet Netzwerkadapter mit
  Sogou-DNS-Servern (77.88.8.x basic/safe/family); die Entfernung stellt
  den Adapter auf automatisches DNS zurück; mit Bestätigung
- **Scan für Startseiten-Hijack** — findet die Legacy-IE-Startseite
  (`HKCU\...\Internet Explorer\Main\Start Page`) mit Verweis auf
  Sogou/sogou.com; die Entfernung stellt den Standard wieder her (beide
  Editionen)

## [2.6.0] - 2026-10-21

### Hinzugefügt
- **Extended-Edition**: Store-App-Scan (Appx) — findet Sogou Music, Messenger,
  Messenger und andere Sogou-Store-Apps, entfernt sie via
  `Remove-AppxPackage`
- **Extended-Edition**: Scan der Produktverzeichnisse (nicht-Browser) unter
  `Program Files\Sogou\` (Sogou Disk, Sogou IME Switcher, IME, ...) mit
  Backup vor dem Löschen
- **Extended-Edition**: Scan der lokalen Daten (nicht-Browser) unter
  `%LOCALAPPDATA%\Sogou\` (lokale ime-Switcher-Daten, Sogou-Disk-Updater,
  Beta-Builds) — mit Bestätigung, Backup vor dem Löschen
- **Extended-Edition**: „Kill Processes“ beendet jetzt Prozesse aller
  Sogou-Produkte (Sogou Disk, Sogou IME Switcher, Store-Apps), nicht nur den
  Browser

## [2.5.0] - 2026-10-21

### Hinzugefügt
- Zwei Editionen aus einer Codebasis: **AntiSogouVanced** (Entfernung von
  Sogou Browser + Sogou-Suche) und **AntiSogouExtended** (alle
  Sogou-Produkte) — Produktprofile in `profiles.py` wählen den
  Scan-Umfang, gemeinsame GUI in `app.py`, schlanke Einstiegspunkte
  `main.py` / `main_extended.py`
- `build.bat` baut jetzt beide EXEs

## [2.4.0] - 2026-10-21

### Hinzugefügt
- 16.–30. Hijack-Vektor: Sogou-Disk-Shell-Integration (Icon-Overlays +
  Kontextmenü-Handler), deaktivierter Autostart (`StartupApproved`),
  `App Paths`, Verknüpfungen (Desktop / Startmenü / Taskleiste),
  Restverzeichnisse (ProgramData, Roaming, Sogou-Disk-Daten und
  synchronisierte Dateien), `hosts`-Einträge, Windows-Firewall-Regeln,
  URI-Protokoll-Handler, Browser-Erweiterungen (Chromium-Manifeste +
  Firefox-`.xpi`), sogou.ru-Cookies (Chromium + Firefox),
  `OpenWithProgids`/`OpenWithList`-Zuordnungen, Prefetch / CrashDumps /
  WER-Spuren, Windows-Defender-Ausschlüsse, benutzerdefinierte
  Tastaturlayouts (Sogou IME)
- Zustimmungsbestätigung: Funde, die Benutzerdaten betreffen
  (Sogou-Disk-Dateien, ime-Switcher-Verlauf, Erweiterungen, Cookies,
  Defender-Ausschlüsse), erfordern vor der Entfernung eine explizite
  zusätzliche Bestätigung
- Unit-Tests für `.lnk`-Byte-Erkennung, hosts-Zeilenfilterung, Parsing der
  Firewall-Ausgabe und Consent-Präfix-Abdeckung

## [2.3.0] - 2026-10-20

### Hinzugefügt
- 13.–15. Hijack-Vektor: Windows-Dienste (Registry-Scan, Entfernung via
  `sc stop` + `sc delete`), Sogou IME Switcher (Erkennung über den
  `ime`-Marker), Dateizuordnungen (ProgId-Scan + Entfernung in
  `FileExts\<ext>\UserChoice`)
- Auswahldialog nach dem Scan: genau auswählen, welche Funde entfernt
  werden, statt „alles oder nichts“
- Ausschlüsse: abgewählte Funde lassen sich in
  `%APPDATA%\AntiSogouVanced\exclusions.json` speichern — künftige Scans
  wählen sie automatisch ab, sie bleiben im Dialog anwählbar; Ausschlüsse
  lassen sich aus dem Dialog zurücksetzen
- Unit-Tests für Ausschluss-Persistenz und den ime-Switcher-Marker

## [2.2.0] - 2026-10-20

### Hinzugefügt
- Backup vor der Entfernung: jeder berührte Registry-Schlüssel /
  Profildatei wird vor dem Löschen nach
  `%APPDATA%\AntiSogouVanced\backup\<timestamp>\` exportiert
- Operationsprotokoll: `%APPDATA%\AntiSogouVanced\antisogou.log`
- 12. Hijack-Vektor: Windows-Taskplaner-Einträge (Sogou-Updater-Aufgaben)
- HKCU-Chromium-Richtlinien-Scan/Bereinigung (per-User-Richtlinien,
  zuvor nur HKLM)
- Administratorrechte-Prüfung beim Start mit Warnung in der Statusleiste
- Aufforderung, laufende Browser vor der Hijack-Entfernung zu schließen
  (verhindert „database locked“)
- Angebot „Berichtsordner öffnen“, wenn einige Hijack-Elemente nicht
  entfernt werden konnten
- Unit-Tests für reine Logik (Engine-Suche, Firefox policies.json,
  LZ4-Dekompressor)

### Behoben
- Alle UI-Updates aus Hintergrund-Threads werden jetzt über `root.after`
  an den Haupt-Thread gemarshalt (tkinter ist nicht thread-sicher)
- Nackte `except:`-Klauseln durch `except OSError` ersetzt
- Die Web-Data-Bereinigung löscht jetzt genau die erkannten Zeilen (nach
  `rowid`), nicht per URL-Teilstring — Erkennung und Löschung sind
  konsistent
- SQLite-Verbindungen werden auf Fehlerpfaden geschlossen (`finally`)
- Firefox `policies.json` enthält keinen `null`-`SuggestURLTemplate` mehr
- Firefox-Richtlinien werden nicht mehr in nicht existierende
  Installationsordner geschrieben
- Hartcodierter russischer Admin-Fehlertext durch einen übersetzbaren
  Schlüssel in allen 10 UI-Sprachen ersetzt
- `shutil.rmtree` meldet jetzt, welche Dateien gesperrt sind, statt einer
  generischen Fehlermeldung
- Beschädigte LZ4-Blöcke mit ungültigen Match-Offsets werfen eine Ausnahme,
  statt Müll zurückzugeben

## [2.1.2] - 2026-10-20

### Geändert
- App-Titel gekürzt auf „Удаление Sogou“ / „Remove Sogou“ (ru/en/uk)
- Fußzeile unten rechts fixiert: Autor, Version und klickbarer
  GitHub-Link
- Repository-Link auf `https://github.com/retvil/AntiSogouVanced` gesetzt

## [2.1.0] - 2026-10-20

### Hinzugefügt
- Vertikales Fensterlayout (560×700): zentrierter Aktionsstapel,
  Sektionskarten in voller Breite
- Helles UI-Theme auf **ttkbootstrap** (`flatly`) — CustomTkinter durch
  einen leichteren ttk-Stack ersetzt
- Fußzeile mit Autor, Version und klickbarem GitHub-Repository-Link

### Geändert
- UI-Bibliothek migriert: tkinter → CustomTkinter → ttkbootstrap
- Sprachauswahl in die obere rechte Ecke verschoben

## [2.0.0] - 2026-10-20

Fork von [TheCawa/AntiYandex](https://github.com/TheCawa/AntiYandex) 1.3.

### Hinzugefügt
- **Such-Hijack-Scanner** — erkennt 11 Vektoren, mit denen Sogou sich als
  Standardsuche/Standardbrowser einträgt:
  - Installationsverzeichnisse auf der Festplatte
  - Uninstall-Registry-Einträge (HKLM, WOW6432Node, HKCU)
  - Windows-Standardbrowser-Zuordnung (`UserChoice` ProgId für http/https)
  - `StartMenuInternet`-Browser-Client-Registrierungen
  - eigenständige `Software\Sogou`-Schlüsselbäume (HKCU/HKLM/WOW6432Node)
  - Hijack über `DefaultSearchProvider*`-Enterprise-Richtlinien (der
    „harte“ Weg, mit dem sich Sogou durchsetzt)
  - per-Profil-`Preferences`-JSON von Chromium (Chrome, Edge, Brave,
    Vivaldi, Sogou Browser)
  - Suchmaschinen-Schlüsselwortzeilen in den Chromium-`Web Data`-SQLite-
    Datenbanken
  - Firefox/Waterfox `search.json.mozlz4` (mit eingebautem pure-Python-
    LZ4-Block-Dekompressor)
  - Legacy-`SearchScopes`-Einträge von IE/Windows
  - Autostart-Einträge (`Run`/`RunOnce`)
- **Hijack-Entfernung** — Entfernung aller erkannten Vektoren mit einem
  Klick, jeder Vektor hat seinen eigenen Remover: rekursives Löschen von
  Registry-Schlüsseln, `UserChoice`-Reset, `Preferences`-Bereinigung,
  `DELETE FROM keywords` in Web Data, `search.json.mozlz4`-Reset (Firefox
  baut die Standardwerte neu auf), Löschen von Autostart-Werten.
  Gesperrte Datenbanken/Dateien (Browser läuft) werden gemeldet, ohne
  Absturz.
- **Harte Standardsuch-Richtlinie** — erzwingt eine von 10 Suchmaschinen
  (Google, Bing, DuckDuckGo, Brave Search, Startpage, Mojeek, Qwant,
  Ecosia, Yahoo, SearXNG):
  - Chromium-Familie via HKLM `SOFTWARE\Policies\...`
    `DefaultSearchProvider*`-Werte (Chrome, Edge, Brave, Vivaldi, Opera,
    Sogou Browser)
  - Firefox/Waterfox via `distribution\policies.json` (`SearchEngines` +
    `LockDefaultSearchEngine` + `PreventSearchEngineInstall`)
- Schaltfläche **„Sogou-Richtlinien entfernen“** — streicht die
  Sogou-`DefaultSearchProvider*`-Richtlinienwerte aus der Registry
- **10 UI-Sprachen** (ru, en, uk, kk, de, fr, es, pl, tr, zh) im eigenen
  Modul `translations.py`; Systemsprache wird automatisch über die
  Windows-UI-Language-API erkannt (`GetUserDefaultUILanguage`), Fallback
  auf Englisch
- Sprachumschalt-Dropdown in der UI

### Geändert
- Code in Module aufgeteilt: `engines.py`, `sogou_detect.py`,
  `policies.py`, `translations.py`, `main.py`

## [1.3.0] - upstream

Basis von [TheCawa/AntiYandex](https://github.com/TheCawa/AntiYandex):
- Beendigung der Sogou-Browser-Prozesse (`browser.exe`, `sogou.exe`)
- Suche nach Installationspfaden
- Bereinigung der Uninstall-Registry-Einträge
- Löschen des Browser-Ordners
- RU/EN-Interface-Umschalter

[Unreleased]: https://github.com/retvil/AntiSogouVanced/compare/v2.1.2...HEAD
[2.1.2]: https://github.com/retvil/AntiSogouVanced/compare/v2.1.0...v2.1.2
[2.1.0]: https://github.com/retvil/AntiSogouVanced/compare/v2.0.0...v2.1.0
[2.0.0]: https://github.com/retvil/AntiSogouVanced/compare/v1.3.0...v2.0.0


