# AntiSogou Vanced

[![Release](https://img.shields.io/github/v/release/retvil/AntiSogouVanced?sort=date)](https://github.com/retvil/AntiSogouVanced/releases) [![Platform Windows](https://img.shields.io/badge/platform-Windows-blue)](https://github.com/retvil/AntiSogouVanced/releases) [![Python](https://img.shields.io/badge/python-3.10%2B-blue)](https://www.python.org/)

**Полное удаление Sogou Browser и жёсткая защита поиска по умолчанию от захвата — 28 векторов (VANCED) / 39 векторов (EXTENDED), 10 поисковиков, 10 языков интерфейса.**

[🇬🇧 English](README.md) | **🇷🇺 Русский** | [🇺🇦 Українська](README.uk.md) | [🇰🇿 Қазақша](README.kk.md) | [🇩🇪 Deutsch](README.de.md) | [🇫🇷 Français](README.fr.md) | [🇪🇸 Español](README.es.md) | [🇵🇱 Polski](README.pl.md) | [🇹🇷 Türkçe](README.tr.md) | [🇨🇳 中文](README.zh.md)

## Что это?

Sogou ставит не просто браузер — он тихо прописывается поиском и браузером по умолчанию через множество механизмов системы: ассоциации в реестре, enterprise-политики, настройки профилей браузеров, даже базы поисковиков внутри профилей Chromium. Удаление одного браузера этого не отменяет.

**AntiSogou Vanced** (форк [TheCawa/AntiYandex](https://github.com/TheCawa/AntiYandex)) находит **все векторы захвата** (28 в VANCED, 39 в EXTENDED), убирает их одной кнопкой, а затем **жёстко закрепляет поиск по умолчанию** за выбранным вами поисковиком через enterprise-политики Windows — чтобы ничего не могло тихо вернуть всё обратно.

## Возможности

- **Сканер захвата** — детект 28 векторов (VANCED) / 39 векторов (EXTENDED): пути установки, записи Uninstall в реестре, ассоциация `UserChoice`, регистрации `StartMenuInternet`, деревья ключей `Software\Sogou`, hijack через политики `DefaultSearchProvider*`, `Preferences` профилей Chromium, ключевые слова в `Web Data` (SQLite), `search.json.mozlz4` Firefox, legacy `SearchScopes`, автозапуск, планировщик задач, службы Windows, IME Switcher, файловые ассоциации, интеграция Sogou Disk в проводнике, отключённый автозапуск, App Paths, ярлыки, остатки в ProgramData/Roaming, записи в hosts, правила брандмауэра, URI-протоколы, расширения браузеров, куки sogou.ru, ассоциации «открыть с помощью», следы Prefetch/WER, исключения Defender, раскладки клавиатуры, hijack стартовой страницы IE, политики стартовых URL (`RestoreOnStartupURLs`), домашняя страница Firefox, зона IE (zone map), записи RegisteredApplications, следы MUICache, инсталляторы в %TEMP%, Store-приложения (Sogou Music), каталоги продуктов, каталоги локальных данных, Sogou.DNS
- **Удаление в один клик** — у каждого вектора свой remover; заблокированные базы честно репортятся, без крашей
- **Жёсткая политика поиска** — закрепляет поиск за одним из 10 поисковиков (Google, Bing, DuckDuckGo, Brave Search, Startpage, Mojeek, Qwant, Ecosia, Yahoo, SearXNG) через HKLM-политики для Chrome, Edge, Brave, Vivaldi, Opera и Sogou Browser + `policies.json` для Firefox/Waterfox
- **Чистка политик** — вычищает значения `DefaultSearchProvider*` Sogou из реестра
- **10 языков интерфейса** — ru, en, uk, kk, de, fr, es, pl, tr, zh; язык системы определяется автоматически
- **Лёгкий интерфейс** — ttkbootstrap, вертикальная компоновка, зафиксированные статус-бар и футер

## Скриншот

<details>
<summary>Главное окно</summary>

![Главное окно AntiSogouVanced](docs/screenshot.png)

</details>

## Готовые сборки

Скачайте из [Releases](https://github.com/retvil/AntiSogouVanced/releases):

- **Windows** — `AntiSogouVanced.exe` (портативный, один файл, ~35 МБ) — удаление Sogou Browser и Sogou Search
- **Windows** — `AntiSogouExtended.exe` (портативный, один файл, ~35 МБ) — удаление всех продуктов Sogou (Sogou Disk, история IME Switcher, общесистемные следы, Store-приложения, Sogou.DNS)

Запускайте **от имени администратора** — HKLM-политики и чистка реестра требуют повышенных прав.

## Установка из исходников

Нужен Python 3.10+ ([python.org](https://python.org)).

```bash
git clone https://github.com/retvil/AntiSogouVanced.git
cd AntiSogouVanced
pip install psutil ttkbootstrap
python main.py
```

Сборка своего EXE: запустите `build.bat` (PyInstaller, результат в `dist/`).

## Использование

1. **Завершить процессы** → **Поиск Sogou** → **Удалить Sogou** — убираем сам браузер.
2. **Сканировать захват поиска** — покажет все способы, которыми Sogou врос в систему.
3. **Удалить захват** — сначала закройте все браузеры, затем уберите всё найденное.
4. Выберите поисковик → **Применить политику** — поиск по умолчанию закреплён на уровне системы.

## FAQ

- **Зачем администратор?** Политики поиска живут в HKLM, чистка захвата трогает системный реестр — нужны повышенные права.
- **«Database locked» в результатах?** Во время чистки был запущен Chromium-браузер. Закройте все браузеры и повторите удаление.
- **Как снять политику поиска?** Кнопка **Снять политику Sogou** вычищает значения политик; в Firefox можно также удалить файл `distribution\policies.json`.

## Автор и поддержка

**Nod33Eset** — форк [TheCawa/AntiYandex](https://github.com/TheCawa/AntiYandex). Issues и PR — приветствуются.

Если инструмент избавил вас от Sogouа — можно поддержать разработку:

**Крипта:**

- BTC: `bc1qunld3rsp37qf5gg69aune50y0qqkd0eugg7j97`
- TON: `UQDmvr4SKOxSION3Yky6aOgzAnCDXySPuAbG4EKJa5JUT7tC`
- USDT (TRC20): `TBPJSSLu1mUcX54g9UyxUohYGf2fuRvbwd`
- USDT (ERC20): `0x25CAED3776Ef5b18E03392bC5b254Bbd78E8180C`
- USDT (SOL): `3qgN5z291CEcj2FUi2Zza5DioxKgNw72kC7P52pCcTrG`

## Лицензия

MIT — см. [LICENSE](LICENSE).


