# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.8.0] - 2026-10-22

### Added
- **Zone map scan** — detects IE zone-map entries for Sogou domains
  (trusted-site leftovers); removal deletes the domain subtree (exported first)
- **RegisteredApplications scan** — detects Sogou entries in default-apps
  metadata; removal deletes the value (exported first)
- **MUICache scan** — detects execution traces of Sogou executables; removal
  deletes the cache value (exported first)
- **%TEMP% installer traces** — scan_traces now also reports Sogou installers
  left in the user temp directory
- **Per-user product dirs** — scan_product_dirs now also covers
  `%LOCALAPPDATA%\Programs\Sogou*` (legacy Sogou Music / Messenger /
  Translate desktop installs), browser folder excluded
- **Vanced process kill by path** — browser-scoped kill now also matches any
  process whose executable lives under a SogouBrowser path (crashpad,
  updater), not only the narrow browser.exe/sogou.exe name list
- **Startup URL policy hijack scan** — detects Sogou URLs in
  `RestoreOnStartupURLs` enterprise policies (Edge, Chrome, Chromium, Brave,
  Vivaldi, Opera, Sogou Browser); removal strips the Sogou values
- **Firefox homepage hijack scan** — detects `browser.startup.homepage`
  pointing to Sogou in Firefox/Waterfox `prefs.js`; removal rewrites the
  file (backed up first)

## [2.7.0] - 2026-10-21

### Added
- **Sogou.DNS scan** (Extended) — detects network adapters configured with
  Sogou DNS servers (77.88.8.x basic/safe/family); removal resets the
  adapter to automatic DNS; consent-gated
- **Start Page hijack scan** — detects the legacy IE homepage
  (`HKCU\...\Internet Explorer\Main\Start Page`) pointing to Sogou/sogou.com;
  removal restores the default (both editions)

## [2.6.0] - 2026-10-21

### Added
- **Extended edition**: Store (Appx) app scan — detects Sogou Music, Alice,
  Messenger and other Sogou Store apps, removes them via `Remove-AppxPackage`
- **Extended edition**: non-browser product directory scan under
  `Program Files\Sogou\` (Sogou Disk, IME Switcher, IME, ...) with
  backup-before-delete removal
- **Extended edition**: non-browser local data scan under
  `%LOCALAPPDATA%\Sogou\` (IME Switcher local data, Sogou Disk updater,
  Beta builds) — consent-gated, backed up before deletion
- **Extended edition**: "Kill Processes" now terminates every Sogou product
  process (Sogou Disk, IME Switcher, Store apps), not just the browser

## [2.5.0] - 2026-10-21

### Added
- Two editions from one codebase: **AntiSogouVanced** (Sogou Browser +
  Sogou Search removal) and **AntiSogouExtended** (every Sogou product) —
  product profiles in `profiles.py` select the scan scope, shared GUI in
  `app.py`, thin entry points `main.py` / `main_extended.py`
- `build.bat` now builds both EXEs

## [2.4.0] - 2026-10-21

### Added
- 16th–30th hijack vectors: Sogou Disk shell integration (icon overlays +
  context-menu handlers), disabled autostart (`StartupApproved`), `App Paths`,
  shortcuts (Desktop / Start Menu / taskbar), leftover directories
  (ProgramData, Roaming, Sogou Disk data and synced files), `hosts` entries,
  Windows Firewall rules, URI protocol handlers, browser extensions
  (Chromium manifests + Firefox `.xpi`), sogou.ru cookies (Chromium +
  Firefox), `OpenWithProgids`/`OpenWithList` associations, Prefetch /
  CrashDumps / WER traces, Windows Defender exclusions, custom keyboard
  layouts (Sogou IME)
- Consent confirmation: findings that touch user data (Sogou Disk files,
  IME Switcher history, extensions, cookies, Defender exclusions) require
  an explicit extra confirmation before removal
- Unit tests for `.lnk` byte detection, hosts-line filtering, firewall output
  parsing and consent-prefix coverage

## [2.3.0] - 2026-10-20

### Added
- 13th–15th hijack vectors: Windows services (registry-based scan, `sc stop` +
  `sc delete` removal), IME Switcher (detection via the `ime` marker),
  file associations (`FileExts\<ext>\UserChoice` ProgId scan + removal)
- Selection dialog after scan: pick exactly which findings to remove instead
  of all-or-nothing removal
- Exclusions: unchecked findings can be saved to
  `%APPDATA%\AntiSogouVanced\exclusions.json` — future scans deselect them
  automatically, but they stay selectable in the dialog; exclusions can be
  reset from the dialog
- Unit tests for exclusions persistence and the IME Switcher marker

## [2.2.0] - 2026-10-20

### Added
- Backup before removal: every registry key / profile file touched is exported
  to `%APPDATA%\AntiSogouVanced\backup\<timestamp>\` before deletion
- Operation log: `%APPDATA%\AntiSogouVanced\antisogou.log`
- 12th hijack vector: Windows Task Scheduler entries (Sogou updater tasks)
- HKCU Chromium policy scan/cleanup (per-user policies, previously HKLM only)
- Administrator-rights check at startup with a warning in the status bar
- Prompt to close running browsers before hijack removal (prevents "database locked")
- "Open report folder" offer when some hijack items fail to be removed
- Unit tests for pure logic (engine lookup, Firefox policies.json, LZ4 decompressor)

### Fixed
- All UI updates from background threads are now marshaled to the main thread
  via `root.after` (tkinter is not thread-safe)
- Bare `except:` clauses replaced with `except OSError`
- Web Data cleanup now deletes exactly the detected rows (by `rowid`), not by
  URL substring — detection and deletion are consistent
- SQLite connections are closed on error paths (`finally`)
- Firefox `policies.json` no longer contains a `null` `SuggestURLTemplate`
- Firefox policies are no longer written into non-existent install folders
- Hardcoded Russian admin-error string replaced with a translated key in all
  10 UI languages
- `shutil.rmtree` now reports which files are locked instead of a generic error
- Corrupt LZ4 blocks with invalid match offsets raise instead of returning garbage

## [2.1.2] - 2026-10-20

### Changed
- App title shortened to "Удаление Sogou" / "Remove Sogou" (ru/en/uk)
- Footer pinned to the bottom-right corner: author, version and clickable GitHub link
- Repository link set to `https://github.com/retvil/AntiSogouVanced`

## [2.1.0] - 2026-10-20

### Added
- Vertical window layout (560×700): centered action stack, full-width section cards
- Light theme UI on **ttkbootstrap** (`flatly` theme) — replaced CustomTkinter for a lighter ttk-based stack
- Footer with author, version and clickable GitHub repository link

### Changed
- Migrated UI library: tkinter → CustomTkinter → ttkbootstrap
- Language selector moved to the top-right corner

## [2.0.0] - 2026-10-20

Fork of [TheCawa/AntiSogou](https://github.com/TheCawa/AntiSogou) 1.3.

### Added
- **Search hijack scanner** — detects 11 vectors Sogou uses to install itself as default search/browser:
  - installation directories on disk
  - uninstall registry entries (HKLM, WOW6432Node, HKCU)
  - Windows default-browser association (`UserChoice` ProgId for http/https)
  - `StartMenuInternet` browser client registrations
  - standalone `Software\Sogou` key trees (HKCU/HKLM/WOW6432Node)
  - enterprise-policy hijack via `DefaultSearchProvider*` registry values (the "hard" way Sogou enforces itself)
  - per-profile Chromium `Preferences` JSON (Chrome, Edge, Brave, Vivaldi, Sogou Browser)
  - search-engine keyword rows in Chromium `Web Data` SQLite databases
  - Firefox/Waterfox `search.json.mozlz4` (with a built-in pure-Python LZ4 block decompressor)
  - legacy IE/Windows `SearchScopes` entries
  - autostart entries (`Run`/`RunOnce`)
- **Hijack removal** — one-click removal of every detected vector, with per-vector removers:
  recursive registry key deletion, `UserChoice` reset, `Preferences` cleanup,
  `DELETE FROM keywords` in Web Data, `search.json.mozlz4` reset (Firefox rebuilds defaults),
  autostart value deletion. Locked databases/files (browser running) are reported, never crash.
- **Hard default-search policy** — enforces one of 10 search engines
  (Google, Bing, DuckDuckGo, Brave Search, Startpage, Mojeek, Qwant, Ecosia, Yahoo, SearXNG):
  - Chromium family via HKLM `SOFTWARE\Policies\...` `DefaultSearchProvider*` values
    (Chrome, Edge, Brave, Vivaldi, Opera, Sogou Browser)
  - Firefox/Waterfox via `distribution\policies.json`
    (`SearchEngines` + `LockDefaultSearchEngine` + `PreventSearchEngineInstall`)
- **Remove Sogou policies** button — strips Sogou `DefaultSearchProvider*` policy values from the registry
- **10 UI languages** (ru, en, uk, kk, de, fr, es, pl, tr, zh) in a dedicated `translations.py` module;
  system language auto-detected via Windows UI language API (`GetUserDefaultUILanguage`),
  English fallback when no match
- Language switcher dropdown in the UI

### Changed
- Code split into modules: `engines.py`, `sogou_detect.py`, `policies.py`, `translations.py`, `main.py`

## [1.3.0] - upstream

Baseline from [TheCawa/AntiSogou](https://github.com/TheCawa/AntiSogou):
- Sogou Browser process termination (`browser.exe`, `sogou.exe`)
- Installation path search
- Uninstall registry entry cleanup
- Browser folder deletion
- RU/EN interface toggle

[Unreleased]: https://github.com/retvil/AntiSogouVanced/compare/v2.1.2...HEAD
[2.1.2]: https://github.com/retvil/AntiSogouVanced/compare/v2.1.0...v2.1.2
[2.1.0]: https://github.com/retvil/AntiSogouVanced/compare/v2.0.0...v2.1.0
[2.0.0]: https://github.com/retvil/AntiSogouVanced/compare/v1.3.0...v2.0.0
