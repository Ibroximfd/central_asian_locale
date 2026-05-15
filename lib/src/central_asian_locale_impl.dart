import 'core/calendar_system.dart';
import 'core/locale_registry.dart';
import 'formatters/date_formatter.dart';
import 'formatters/number_formatter.dart';

export 'core/calendar_system.dart';
export 'core/locale_data.dart';
export 'core/locale_registry.dart';
export 'formatters/date_formatter.dart';
export 'formatters/number_formatter.dart';

/// Main entry point.
///
/// ```dart
/// final ca = CentralAsianLocale.of(CaLocale.uzLatn);
/// ca.date.format(DateTime.now(), 'dd MMMM yyyy'); // "15 May 2026"
/// ca.number.formatCurrency(150000);               // "150 000 so'm"
/// ```
final class CentralAsianLocale {
  CentralAsianLocale._(this.locale)
      : date = CaDateFormatter(locale: LocaleRegistry.get(locale)),
        number = CaNumberFormatter(locale: LocaleRegistry.get(locale));

  final CaLocale locale;
  final CaDateFormatter date;
  final CaNumberFormatter number;

  static final _cache = <CaLocale, CentralAsianLocale>{};

  static CentralAsianLocale of(CaLocale locale) =>
      _cache.putIfAbsent(locale, () => CentralAsianLocale._(locale));

  static String formatDate(
    DateTime dt,
    String pattern, {
    required CaLocale locale,
    CalendarSystem? calendar,
  }) =>
      of(locale).date.format(dt, pattern, calendar: calendar);

  static String formatNumber(
    num value, {
    required CaLocale locale,
    int decimalPlaces = 0,
  }) =>
      of(locale).number.formatNumber(value, decimalPlaces: decimalPlaces);

  static String formatCurrency(
    num value, {
    required CaLocale locale,
    int decimalPlaces = 0,
  }) =>
      of(locale).number.formatCurrency(value, decimalPlaces: decimalPlaces);
}
