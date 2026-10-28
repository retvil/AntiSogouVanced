# Журнал изменений

Все значимые изменения проекта документируются в этом файле.

Формат основан на [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
проект следует [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

> Первоисточник — английский [CHANGELOG.md](CHANGELOG.md); этот перевод может немного отставать.

## [2.8.0] - 2026-10-22

### Добавлено
- **Скан зоны IE (zone map)** — находит записи zone-map для доменов Sogouа
  (остатки «надёжных сайтов»); удаление сносит поддерево домена (сначала экспорт)
- **Скан RegisteredApplications** — находит записи Sogouа в метаданных
  приложений по умолчанию; удаление стирает значение (сначала экспорт)
- **Скан MUICache** — находит следы запуска исполняемых файлов Sogouа;
  удаление стирает значение кэша (сначала экспорт)
- **Следы инсталляторов в %TEMP%** — scan_traces теперь также репортит
  инсталляторы Sogouа, оставшиеся во временной папке пользователя
- **Каталоги продуктов per-user** — scan_product_dirs теперь также покрывает
  `%LOCALAPPDATA%\Programs\Sogou*` (legacy-установки Sogou Музыки /
  Мессенджера / Переводчика), папка браузера исключена
- **Kill процессов по пути (Vanced)** — браузерный kill теперь также матчит
  процессы, чей exe лежит под путём SogouBrowser (crashpad, updater),
  а не только узкий список имён browser.exe/sogou.exe
- **Скан hijack стартовых URL** — находит URL Sogouа в enterprise-политикаx
  `RestoreOnStartupURLs` (Edge, Chrome, Chromium, Brave, Vivaldi, Opera,
  Sogou.Браузер); удаление вычищает значения Sogouа
- **Скан hijack домашней страницы Firefox** — находит
  `browser.startup.homepage` со ссылкой на Sogou в `prefs.js`
  Firefox/Waterfox; удаление переписывает файл (сначала бэкап)

## [2.7.0] - 2026-10-21

### Добавлено
- **Скан Sogou.DNS** (Extended) — находит сетевые адаптеры с DNS-серверами
  Sogouа (77.88.8.x basic/safe/family); удаление возвращает адаптеру
  автоматический DNS; с подтверждением
- **Скан hijack стартовой страницы** — находит legacy-домашнюю страницу IE
  (`HKCU\...\Internet Explorer\Main\Start Page`) со ссылкой на Sogou/sogou.com;
  удаление возвращает дефолт (оба издания)

## [2.6.0] - 2026-10-21

### Добавлено
- **Extended-издание**: скан Store (Appx) приложений — находит Sogou Музыку,
  Алису, Мессенджер и другие Store-приложения Sogouа, удаляет через
  `Remove-AppxPackage`
- **Extended-издание**: скан каталогов небраузерных продуктов под
  `Program Files\Sogou\` (Sogou.Диск, Sogou IME Switcher, IME, ...) с бэкапом
  перед удалением
- **Extended-издание**: скан локальных данных небраузерных продуктов под
  `%LOCALAPPDATA%\Sogou\` (локальные данные Sogou IME Switcher, апдейтер
  Sogou.Диска, Beta-сборки) — с подтверждением, бэкап перед удалением
- **Extended-издание**: «Kill Processes» теперь завершает процессы всех
  продуктов Sogouа (Sogou.Диск, Sogou IME Switcher, Store-приложения),
  а не только браузера

## [2.5.0] - 2026-10-21

### Добавлено
- Два издания из одной кодовой базы: **AntiSogouVanced** (удаление
  Sogou.Браузера + Sogou.Поиска) и **AntiSogouExtended** (все продукты
  Sogouа) — профили продуктов в `profiles.py` выбирают охват скана, общий
  GUI в `app.py`, тонкие точки входа `main.py` / `main_extended.py`
- `build.bat` теперь собирает оба EXE

## [2.4.0] - 2026-10-21

### Добавлено
- 16-й–30-й векторы hijack: интеграция Sogou.Диска в оболочку (иконки-оверлеи
  + обработчики контекстного меню), отключённый автозапуск (`StartupApproved`),
  `App Paths`, ярлыки (Рабочий стол / Меню Пуск / панель задач),
  каталоги-остатки (ProgramData, Roaming, данные Sogou.Диска и
  синхронизированные файлы), записи `hosts`, правила брандмауэра Windows,
  обработчики URI-протоколов, расширения браузеров (манифесты Chromium +
  `.xpi` Firefox), куки sogou.ru (Chromium + Firefox), ассоциации
  `OpenWithProgids`/`OpenWithList`, следы Prefetch / CrashDumps / WER,
  исключения Windows Defender, пользовательские раскладки клавиатуры
  (Sogou IME)
- Подтверждение согласия: находки, затрагивающие пользовательские данные
  (файлы Sogou.Диска, история Sogou IME Switcher, расширения, куки, исключения
  Defender), требуют явного дополнительного подтверждения перед удалением
- Юнит-тесты для байт-детекта `.lnk`, фильтрации строк hosts, парсинга вывода
  брандмауэра и покрытия consent-префиксов

## [2.3.0] - 2026-10-20

### Добавлено
- 13-й–15-й векторы hijack: службы Windows (скан по реестру, удаление через
  `sc stop` + `sc delete`), Sogou IME Switcher (детект по маркеру `ime`),
  файловые ассоциации (скан + удаление ProgId в `FileExts\<ext>\UserChoice`)
- Диалог выбора после скана: выбрать, какие именно находки удалять, вместо
  «всё или ничего»
- Исключения: снятые галочки можно сохранить в
  `%APPDATA%\AntiSogouVanced\exclusions.json` — будущие сканы автоматически
  их не выбирают, но они остаются доступными в диалоге; исключения можно
  сбросить из диалога
- Юнит-тесты персистентности исключений и маркера Sogou IME Switcher

## [2.2.0] - 2026-10-20

### Добавлено
- Бэкап перед удалением: каждый затронутый ключ реестра / файл профиля
  экспортируется в `%APPDATA%\AntiSogouVanced\backup\<timestamp>\` перед
  удалением
- Журнал операций: `%APPDATA%\AntiSogouVanced\antisogou.log`
- 12-й вектор hijack: записи Планировщика задач Windows (задачи апдейтера
  Sogouа)
- Скан/чистка HKCU-политик Chromium (per-user политики, раньше только HKLM)
- Проверка прав администратора при старте с предупреждением в статус-баре
- Предложение закрыть запущенные браузеры перед удалением hijack
  (предотвращает «database locked»)
- Предложение «открыть папку отчёта», когда часть hijack-находок не удалилась
- Юнит-тесты чистой логики (поиск движка, Firefox policies.json,
  LZ4-декомпрессор)

### Исправлено
- Все обновления UI из фоновых потоков теперь маршалируются в главный поток
  через `root.after` (tkinter не потокобезопасен)
- Голые `except:` заменены на `except OSError`
- Чистка Web Data теперь удаляет ровно найденные строки (по `rowid`), а не по
  подстроке URL — детект и удаление согласованы
- SQLite-соединения закрываются на error-путях (`finally`)
- Firefox `policies.json` больше не содержит `null` `SuggestURLTemplate`
- Политики Firefox больше не пишутся в несуществующие папки установки
- Захардкоженная русская строка ошибки админа заменена на переводимый ключ
  во всех 10 языках UI
- `shutil.rmtree` теперь репортит, какие файлы заблокированы, вместо общей
  ошибки
- Битые LZ4-блоки с невалидными смещениями вызывают исключение вместо возврата
  мусора

## [2.1.2] - 2026-10-20

### Изменено
- Заголовок приложения сокращён до «Удаление Sogou» / «Remove Sogou»
  (ru/en/uk)
- Футер прижат к правому нижнему углу: автор, версия и кликабельная ссылка
  на GitHub
- Ссылка репозитория установлена на `https://github.com/retvil/AntiSogouVanced`

## [2.1.0] - 2026-10-20

### Добавлено
- Вертикальная компоновка окна (560×700): центрированный стек действий,
  карточки секций на всю ширину
- Светлая тема UI на **ttkbootstrap** (тема `flatly`) — замена CustomTkinter
  на более лёгкий ttk-стек
- Футер с автором, версией и кликабельной ссылкой на репозиторий GitHub

### Изменено
- Миграция UI-библиотеки: tkinter → CustomTkinter → ttkbootstrap
- Селектор языка перенесён в правый верхний угол

## [2.0.0] - 2026-10-20

Форк [TheCawa/AntiSogou](https://github.com/TheCawa/AntiSogou) 1.3.

### Добавлено
- **Сканер hijack поиска** — детектит 11 векторов, которыми Sogou
  прописывается дефолтным поиском/браузером:
  - каталоги установки на диске
  - записи Uninstall в реестре (HKLM, WOW6432Node, HKCU)
  - ассоциация браузера по умолчанию Windows (`UserChoice` ProgId для
    http/https)
  - регистрации клиентов браузеров `StartMenuInternet`
  - отдельные деревья ключей `Software\Sogou` (HKCU/HKLM/WOW6432Node)
  - hijack через enterprise-политики `DefaultSearchProvider*` (жёсткий способ
    закрепления Sogouа)
  - per-profile JSON `Preferences` Chromium (Chrome, Edge, Brave, Vivaldi,
    Sogou.Браузер)
  - строки ключевых слов поисковиков в SQLite-базах `Web Data` Chromium
  - Firefox/Waterfox `search.json.mozlz4` (со встроенным pure-Python
    LZ4-декомпрессором блоков)
  - legacy-записи `SearchScopes` IE/Windows
  - записи автозапуска (`Run`/`RunOnce`)
- **Удаление hijack** — удаление всех найденных векторов одним кликом,
  у каждого вектора свой remover: рекурсивное удаление ключей реестра,
  сброс `UserChoice`, чистка `Preferences`, `DELETE FROM keywords` в Web Data,
  сброс `search.json.mozlz4` (Firefox пересоздаёт дефолты), удаление значений
  автозапуска. Заблокированные базы/файлы (браузер запущен) репортятся,
  без крашей.
- **Жёсткая политика поиска по умолчанию** — закрепляет один из 10
  поисковиков (Google, Bing, DuckDuckGo, Brave Search, Startpage, Mojeek,
  Qwant, Ecosia, Yahoo, SearXNG):
  - семейство Chromium через HKLM `SOFTWARE\Policies\...` значения
    `DefaultSearchProvider*` (Chrome, Edge, Brave, Vivaldi, Opera,
    Sogou.Браузер)
  - Firefox/Waterfox через `distribution\policies.json` (`SearchEngines` +
    `LockDefaultSearchEngine` + `PreventSearchEngineInstall`)
- Кнопка **«Удалить политики Sogouа»** — вычищает значения политик
  `DefaultSearchProvider*` Sogouа из реестра
- **10 языков UI** (ru, en, uk, kk, de, fr, es, pl, tr, zh) в отдельном модуле
  `translations.py`; язык системы определяется автоматически через Windows UI
  language API (`GetUserDefaultUILanguage`), фолбэк на английский
- Выпадающий список смены языка в UI

### Изменено
- Код разбит на модули: `engines.py`, `sogou_detect.py`, `policies.py`,
  `translations.py`, `main.py`

## [1.3.0] - upstream

База [TheCawa/AntiSogou](https://github.com/TheCawa/AntiSogou):
- Завершение процессов Sogou.Браузера (`browser.exe`, `sogou.exe`)
- Поиск путей установки
- Чистка записей Uninstall в реестре
- Удаление папки браузера
- Переключатель интерфейса RU/EN

[Unreleased]: https://github.com/retvil/AntiSogouVanced/compare/v2.1.2...HEAD
[2.1.2]: https://github.com/retvil/AntiSogouVanced/compare/v2.1.0...v2.1.2
[2.1.0]: https://github.com/retvil/AntiSogouVanced/compare/v2.0.0...v2.1.0
[2.0.0]: https://github.com/retvil/AntiSogouVanced/compare/v1.3.0...v2.0.0
