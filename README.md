# central_asian_locale

[![pub version](https://img.shields.io/pub/v/central_asian_locale.svg)](https://pub.dev/packages/central_asian_locale)
[![pub points](https://img.shields.io/pub/points/central_asian_locale)](https://pub.dev/packages/central_asian_locale)
[![likes](https://img.shields.io/pub/likes/central_asian_locale)](https://pub.dev/packages/central_asian_locale)

Complete localization for **Uzbek** (Latin & Cyrillic), **Kazakh**, **Tajik**, and **Kyrgyz** — the first Flutter package to cover all Central Asian languages with:

- ✅ Correct month and weekday names (CLDR-verified, native speaker reviewed)
- ✅ Date formatting with Gregorian, Hijri (قمری), and Solar Hijri (شمسی) calendar support
- ✅ Locale-aware number and currency formatting (UZS, KZT, TJS, KGS)
- ✅ Relative time: `"3 soat oldin"`, `"2 kundan keyin"`
- ✅ Ordinal suffixes with proper vowel harmony (Kazakh: `-ші`/`-шы`)
- ✅ Zero external dependencies (only `intl` from the Dart SDK)
- ✅ Const locale instances — no heap allocation on hot paths

---

## Quick start

```dart
import 'package:central_asian_locale/central_asian_locale.dart';

final ca = CentralAsianLocale.of(CaLocale.uzLatn);

// Date
ca.date.format(DateTime.now(), 'dd MMMM yyyy');   // "15 May 2026"
ca.date.format(DateTime.now(), 'EEEE, dd MMM');   // "Juma, 15 May"

// Date with Hijri calendar
ca.date.format(DateTime.now(), 'dd MMMM yyyy',
  calendar: CalendarSystem.hijri);                // "17 Shavval 1447"

// Relative time
ca.date.formatRelative(                           // "3 soat oldin"
  DateTime.now().subtract(Duration(hours: 3)));

// Ordinal
ca.date.formatOrdinal(5);                         // "5-nchi"

// Numbers
ca.number.formatNumber(1234567);                  // "1 234 567"
ca.number.formatNumber(3.14159, decimalPlaces: 2);// "3,14"
ca.number.formatCurrency(150000);                 // "150 000 so'm"
ca.number.formatPercent(0.856);                   // "85,60%"
```

---

## Supported locales

| Locale | Tag | Currency | Script |
|--------|-----|----------|--------|
| Uzbek (Latin) | `uz-Latn-UZ` | UZS (so'm) | Latin |
| Uzbek (Cyrillic) | `uz-Cyrl-UZ` | UZS (сўм) | Cyrillic |
| Kazakh | `kk-KZ` | KZT (₸) | Cyrillic |
| Tajik | `tg-TJ` | TJS (SM) | Cyrillic |
| Kyrgyz | `ky-KG` | KGS (с) | Cyrillic |

---

## Date format tokens

| Token | Description | Example |
|-------|-------------|---------|
| `yyyy` | 4-digit year | `2026` |
| `yy` | 2-digit year | `26` |
| `MMMM` | Full month | `May` / `Май` |
| `MMM` | Short month | `May` / `Май` |
| `MM` | 2-digit month | `05` |
| `dd` | 2-digit day | `08` |
| `d` | Day | `8` |
| `EEEE` | Full weekday | `Juma` |
| `EEE` | Short weekday | `Ju` |
| `HH` | 24h hour | `14` |
| `hh` | 12h hour | `02` |
| `mm` | Minutes | `30` |
| `ss` | Seconds | `05` |
| `a` | AM/PM | `TK` |

---

## Calendar systems

```dart
// Hijri (lunar Islamic)
ca.date.format(dt, 'dd MMMM yyyy', calendar: CalendarSystem.hijri);

// Solar Hijri (used in Tajikistan / Iran)
ca.date.format(dt, 'dd MMMM yyyy', calendar: CalendarSystem.solarHijri);

// Direct CalendarDate conversion
final hijri = CalendarDate.fromDateTime(DateTime.now(), CalendarSystem.hijri);
print(hijri); // 1447-10-17 (hijri)
```

---

## Performance

All locale data instances are `const` — shared across the app with no heap allocation. `CentralAsianLocale.of()` caches formatter instances per locale. Formatting uses `StringBuffer` for O(n) string construction with no intermediate allocations.

```dart
// These return the same cached instance — safe to call on every build
final ca1 = CentralAsianLocale.of(CaLocale.uzLatn);
final ca2 = CentralAsianLocale.of(CaLocale.uzLatn);
assert(identical(ca1, ca2)); // true
```

---

## Contributing

Locale data corrections and new locales (Uyghur, Turkmen, Azerbaijani) are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md).

---

## License

BSD-3-Clause © 2026
