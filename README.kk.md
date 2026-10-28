# AntiSogou Vanced

**🇬🇧 English** | [🇷🇺 Русский](README.ru.md) | [🇺🇦 Українська](README.uk.md) | [🇰🇿 Қазақша](README.kk.md) | [🇩🇪 Deutsch](README.de.md) | [🇫🇷 Français](README.fr.md) | [🇪🇸 Español](README.es.md) | [🇵🇱 Polski](README.pl.md) | [🇹🇷 Türkçe](README.tr.md) | [🇨🇳 中文](README.zh.md)

## Бұл не?

Sogou жай ғана браузер орнатпайды — ол жүйенің көптеген механизмі арқылы әдепкі іздеу/браузер болып үнсіз тіркеледі: реестр ассоциациялары, enterprise-саясаттар, браузер профильдерінің параметрлері, тіпті Chromium профильдеріндегі іздеу жүйелерінің базалары. Бір браузерді жою мұның бәрін жоймайды.

**AntiSogou Vanced** ([TheCawa/AntiYandex](https://github.com/TheCawa/AntiYandex) форкі) **барлық ұрлау векторын** (VANCED-да 28, EXTENDED-да 39) табады, бір батырмамен алып тастайды, содан кейін әдепкі іздеуді таңдаған іздеу жүйеңізге Windows enterprise-саясаттары арқылы **қатайтып бекітеді** — ештеңе үнсіз қайтарып алмас үшін.

## Мүмкіндіктер

- **Ұрлау сканері** — 28 векторов (VANCED) / 39 векторов (EXTENDED) анықтау: орнату жолдары, реестрдегі Uninstall жазбалары, `UserChoice` ассоциациясы, `StartMenuInternet` тіркелулері, `Software\Sogou` кілттер ағаштары, `DefaultSearchProvider*` саясаттары арқылы ұрлау, Chromium профильдерінің `Preferences` параметрлері, `Web Data` (SQLite) кілт сөздері, Firefox `search.json.mozlz4`, legacy `SearchScopes`, автозапуск, тапсырмалар жоспарлаушы, Windows қызметтері, IME Switcher, файлдық байланыстырулар, Sogou Disk интеграциясы, өшірілген автозапуск, App Paths, жарлықтар, ProgramData/Roaming қалдықтары, hosts жазбалары, брандмауэр ережелері, URI-протоколдар, браузер кеңейтулері, sogou.ru cookie файлдары, «көмегімен ашу» ассоциациялары, Prefetch/WER іздері, Defender ерекшеліктері, пернетақта орналасулары, IE бастапқы бетін ұрлау, бастапқы URL саясаттары (`RestoreOnStartupURLs`), Firefox басты беті, IE аймақ картасы, RegisteredApplications жазбалары, MUICache іздері, %TEMP% орнатқыштары, Store қосымшалары (Sogou Music), өнім каталогтары, жергілікті деректер каталогтары, Sogou.DNS
- **Бір батырмамен жою** — әр вектордың өз remover-ы бар; бұғатталған базалар шынайы репортталады, крашсыз
- **Қатаң іздеу саясаты** — іздеуді 10 іздеу жүйесінің біреуіне (Google, Bing, DuckDuckGo, Brave Search, Startpage, Mojeek, Qwant, Ecosia, Yahoo, SearXNG) бекітеді: Chrome, Edge, Brave, Vivaldi, Opera және Sogou Browser үшін HKLM-саясаттар + Firefox/Waterfox үшін `policies.json`
- **Саясат тазарту** — Sogou `DefaultSearchProvider*` мәндерін реестрден тазартады
- **10 интерфейс тілі** — ru, en, uk, kk, de, fr, es, pl, tr, zh; жүйе тілі автоматты анықталады
- **Жеңіл интерфейс** — ttkbootstrap, вертикальді компоновка, бекітілген статус-бар және футер

## Скриншот

<details>
<summary>Негізгі терезе</summary>

![AntiSogouVanced негізгі терезесі](docs/screenshot.png)

</details>

## Дайын жинақтар

[Releases](https://github.com/retvil/AntiSogouVanced/releases) бетінен жүктеп алыңыз:

- **Windows** — `AntiSogouVanced.exe` (портативті, бір файл, ~35 МБ) — Sogou Browser және Sogou Search жою
- **Windows** — `AntiSogouExtended.exe` (портативті, бір файл, ~35 МБ) — Sogou-ның барлық өнімдерін жою (Sogou Disk, IME Switcher тарихы, жүйелік іздер, Store қосымшалары, Sogou.DNS)

**Әкімші ретінде** іске қосыңыз — HKLM-саясаттар мен реестр тазартуы жоғарылау құқықтарды қажет етеді.

## Бастапқы кодтан орнату

Python 3.10+ қажет ([python.org](https://python.org)).

```bash
git clone https://github.com/retvil/AntiSogouVanced.git
cd AntiSogouVanced
pip install psutil ttkbootstrap
python main.py
```

Өз EXE-ді жинау: `build.bat` іске қосыңыз (PyInstaller, нәтиже `dist/` ішінде).

## Пайдалану

1. **Процессерді тоқтату** → **Sogou-ді іздеу** → **Sogou-ді жою** — браузердің өзін жоямыз.
2. **Іздеу ұрлауын сканерлеу** — Sogou жүйеге қалай енгенін толық көрсетеді.
3. **Ұрлауды жою** — алдымен барлық браузерді жабыңыз, сосын табылғанның бәрін алып тастаңыз.
4. Іздеу жүйесін таңдаңыз → **Саясатты қолдану** — әдепкі іздеу жүйе деңгейінде бекітілді.

## FAQ

- **Неге әкімші?** Іздеу саясаттары HKLM-де тұрады, ұрлау тазартуы жүйелік реестрге тиеді — жоғары құқықтар керек.
- **Нәтижелерде «Database locked»?** Тазарту кезінде Chromium браузері істе тұрған. Барлық браузерді жабып, жоюды қайталаңыз.
- **Іздеу саясатын қалай алып тастауға болады?** **Саясатты қолдану**... **Sogou саясатын алып тастау** батырмасы саясат мәндерін тазартады; Firefox-та `distribution\policies.json` файлын жоюға болады.

## Автор және қолдау

**Nod33Eset** — [TheCawa/AntiYandex](https://github.com/TheCawa/AntiYandex) форкі. Issues мен PR — қош келдіңіз.

Егер құрал сізді Sogouтен құтқарса — дамуды қолдауға болады:

**Крипта:**

- BTC: `bc1qunld3rsp37qf5gg69aune50y0qqkd0eugg7j97`
- TON: `UQDmvr4SKOxSION3Yky6aOgzAnCDXySPuAbG4EKJa5JUT7tC`
- USDT (TRC20): `TBPJSSLu1mUcX54g9UyxUohYGf2fuRvbwd`
- USDT (ERC20): `0x25CAED3776Ef5b18E03392bC5b254Bbd78E8180C`
- USDT (SOL): `3qgN5z291CEcj2FUi2Zza5DioxKgNw72kC7P52pCcTrG`

## Лицензия

MIT — қ. [LICENSE](LICENSE).



