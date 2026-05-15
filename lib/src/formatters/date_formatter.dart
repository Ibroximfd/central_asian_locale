import '../core/calendar_system.dart';
import '../core/formatter_base.dart';
import '../core/locale_data.dart';

final class CaDateFormatter implements FormatterBase {
  CaDateFormatter({required LocaleData locale})
      : context = FormatterContext(locale: locale);

  @override
  final FormatterContext context;

  LocaleData get _loc => context.locale;

  String format(DateTime dt, String pattern, {CalendarSystem? calendar}) {
    final date = calendar != null && calendar != CalendarSystem.gregorian
        ? CalendarDate.fromDateTime(dt, calendar)
        : null;

    final y = date?.year ?? dt.year;
    final mo = date?.month ?? dt.month;
    final d = date?.day ?? dt.day;
    final wd = dt.weekday - 1;
    final h24 = dt.hour;
    final h12 = h24 == 0 ? 12 : (h24 > 12 ? h24 - 12 : h24);
    final mi = dt.minute;
    final s = dt.second;
    final isAm = h24 < 12;

    final buf = StringBuffer();
    var i = 0;
    while (i < pattern.length) {
      final ch = pattern[i];
      if (ch == 'y') {
        final c = _count(pattern, i, 'y');
        buf.write(c >= 4
            ? y.toString().padLeft(4, '0')
            : (y % 100).toString().padLeft(2, '0'));
        i += c;
      } else if (ch == 'M') {
        final c = _count(pattern, i, 'M');
        if (c >= 4)
          buf.write(_loc.monthNames[mo]);
        else if (c == 3)
          buf.write(_loc.monthNamesShort[mo]);
        else if (c == 2)
          buf.write(mo.toString().padLeft(2, '0'));
        else
          buf.write(mo.toString());
        i += c;
      } else if (ch == 'd') {
        final c = _count(pattern, i, 'd');
        buf.write(c >= 2 ? d.toString().padLeft(2, '0') : d.toString());
        i += c;
      } else if (ch == 'E') {
        final c = _count(pattern, i, 'E');
        buf.write(c >= 4 ? _loc.weekdayNames[wd] : _loc.weekdayNamesShort[wd]);
        i += c;
      } else if (ch == 'H') {
        final c = _count(pattern, i, 'H');
        buf.write(c >= 2 ? h24.toString().padLeft(2, '0') : h24.toString());
        i += c;
      } else if (ch == 'h') {
        final c = _count(pattern, i, 'h');
        buf.write(c >= 2 ? h12.toString().padLeft(2, '0') : h12.toString());
        i += c;
      } else if (ch == 'm') {
        final c = _count(pattern, i, 'm');
        buf.write(c >= 2 ? mi.toString().padLeft(2, '0') : mi.toString());
        i += c;
      } else if (ch == 's') {
        final c = _count(pattern, i, 's');
        buf.write(c >= 2 ? s.toString().padLeft(2, '0') : s.toString());
        i += c;
      } else if (ch == 'a') {
        buf.write(isAm ? _loc.dayPeriods.am : _loc.dayPeriods.pm);
        i++;
      } else {
        buf.write(ch);
        i++;
      }
    }
    return buf.toString();
  }

  String formatRelative(DateTime dt, {DateTime? relativeTo}) {
    final now = relativeTo ?? DateTime.now();
    final diff = dt.difference(now);
    final abs = diff.abs();
    final isPast = diff.isNegative;

    final (String unit, int count) = switch (abs) {
      Duration d when d.inSeconds < 60 => ('second', abs.inSeconds),
      Duration d when d.inMinutes < 60 => ('minute', abs.inMinutes),
      Duration d when d.inHours < 24 => ('hour', abs.inHours),
      Duration d when d.inDays < 7 => ('day', abs.inDays),
      Duration d when d.inDays < 30 => ('week', abs.inDays ~/ 7),
      Duration d when d.inDays < 365 => ('month', abs.inDays ~/ 30),
      _ => ('year', abs.inDays ~/ 365),
    };

    final template = _loc.relativeTimeTemplates[unit];
    if (template == null) return '';
    final tmpl = isPast ? template.past : template.future;
    return tmpl.replaceAll('{n}', count.toString());
  }

  String formatOrdinal(int n) => '$n${_loc.ordinalSuffix(n)}';

  static int _count(String s, int start, String ch) {
    var i = start;
    while (i < s.length && s[i] == ch) i++;
    return i - start;
  }
}
