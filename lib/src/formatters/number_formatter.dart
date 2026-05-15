import '../core/formatter_base.dart';
import '../core/locale_data.dart';

final class CaNumberFormatter implements FormatterBase {
  CaNumberFormatter({required LocaleData locale})
      : context = FormatterContext(locale: locale);

  @override
  final FormatterContext context;

  LocaleData get _loc => context.locale;

  String formatNumber(
    num value, {
    int decimalPlaces = 0,
    bool useGrouping = true,
  }) {
    final factor = decimalPlaces > 0 ? _pow10(decimalPlaces) : 1;
    final rounded = (value * factor).round() / factor;
    final isNegative = rounded < 0;
    final abs = rounded.abs();
    final intPart = abs.truncate();
    final fracPart =
        decimalPlaces > 0 ? ((abs - intPart) * factor).round() : null;

    final buf = StringBuffer();
    if (isNegative) buf.write('-');
    buf.write(_groupInteger(intPart, useGrouping));
    if (fracPart != null) {
      buf.write(_loc.decimalSeparator);
      buf.write(fracPart.toString().padLeft(decimalPlaces, '0'));
    }
    return buf.toString();
  }

  String formatCurrency(
    num value, {
    int decimalPlaces = 0,
    bool useGrouping = true,
    String? overrideSymbol,
  }) {
    final symbol = overrideSymbol ?? _loc.currencySymbol;
    final formatted =
        formatNumber(value, decimalPlaces: decimalPlaces, useGrouping: useGrouping);
    return _loc.currencySymbolLeads ? '$symbol$formatted' : '$formatted $symbol';
  }

  String formatPercent(double value, {int decimalPlaces = 2}) =>
      '${formatNumber(value * 100, decimalPlaces: decimalPlaces)}%';

  String _groupInteger(int n, bool useGrouping) {
    final raw = n.toString();
    if (!useGrouping || raw.length <= 3) return raw;
    final buf = StringBuffer();
    final offset = raw.length % 3;
    if (offset > 0) buf.write(raw.substring(0, offset));
    for (var i = offset; i < raw.length; i += 3) {
      if (buf.isNotEmpty) buf.write(_loc.groupSeparator);
      buf.write(raw.substring(i, i + 3));
    }
    return buf.toString();
  }

  static int _pow10(int exp) {
    var r = 1;
    for (var i = 0; i < exp; i++) r *= 10;
    return r;
  }
}
