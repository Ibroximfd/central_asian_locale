enum CalendarSystem { gregorian, hijri, solarHijri }

final class CalendarDate {
  const CalendarDate({
    required this.year,
    required this.month,
    required this.day,
    this.calendar = CalendarSystem.gregorian,
  });

  final int year;
  final int month;
  final int day;
  final CalendarSystem calendar;

  static CalendarDate fromDateTime(
    DateTime dt, [
    CalendarSystem cal = CalendarSystem.gregorian,
  ]) {
    return switch (cal) {
      CalendarSystem.gregorian =>
        CalendarDate(year: dt.year, month: dt.month, day: dt.day),
      CalendarSystem.hijri => _gregorianToHijri(dt),
      CalendarSystem.solarHijri => _gregorianToSolarHijri(dt),
    };
  }

  DateTime toDateTime() {
    return switch (calendar) {
      CalendarSystem.gregorian => DateTime(year, month, day),
      CalendarSystem.hijri => _hijriToGregorian(year, month, day),
      CalendarSystem.solarHijri => _solarHijriToGregorian(year, month, day),
    };
  }

  static int _gregorianToJulianDay(DateTime dt) {
    final a = (14 - dt.month) ~/ 12;
    final y = dt.year + 4800 - a;
    final m = dt.month + 12 * a - 3;
    return dt.day +
        (153 * m + 2) ~/ 5 +
        365 * y +
        y ~/ 4 -
        y ~/ 100 +
        y ~/ 400 -
        32045;
  }

  static DateTime _julianDayToGregorian(int jd) {
    final l = jd + 68569;
    final n = (4 * l) ~/ 146097;
    final lv = l - (146097 * n + 3) ~/ 4;
    final i = (4000 * (lv + 1)) ~/ 1461001;
    final lv2 = lv - (1461 * i) ~/ 4 + 31;
    final j = (80 * lv2) ~/ 2447;
    final d = lv2 - (2447 * j) ~/ 80;
    final lv3 = j ~/ 11;
    final m = j + 2 - 12 * lv3;
    final y = 100 * (n - 49) + i + lv3;
    return DateTime(y, m, d);
  }

  static int _hijriToJulianDay(int hy, int hm, int hd) {
    return ((11 * hy + 3) ~/ 30) +
        354 * hy +
        30 * hm -
        ((hm - 1) ~/ 2) +
        hd +
        1948029;
  }

  static DateTime _hijriToGregorian(int hy, int hm, int hd) {
    return _julianDayToGregorian(_hijriToJulianDay(hy, hm, hd));
  }

  static CalendarDate _gregorianToHijri(DateTime dt) {
    final jd = _gregorianToJulianDay(dt);
    var y = ((30 * (jd - 1948440) + 10646) ~/ 10631);
    if (y < 1) y = 1;
    while (_hijriToJulianDay(y + 1, 1, 1) <= jd) {
      y++;
    }
    while (_hijriToJulianDay(y, 1, 1) > jd) {
      y--;
    }
    var m = 1;
    while (m < 12 && _hijriToJulianDay(y, m + 1, 1) <= jd) {
      m++;
    }
    final d = jd - _hijriToJulianDay(y, m, 1) + 1;
    return CalendarDate(
      year: y,
      month: m,
      day: d,
      calendar: CalendarSystem.hijri,
    );
  }

  static DateTime _solarHijriToGregorian(int sy, int sm, int sd) {
    final jy = sy - 979;
    final jm = sm - 1;
    var jDayNo = 365 * jy + (jy ~/ 4) * 8 + (jy + 3) ~/ 4;
    const jmd0 = [0,31,59,90,120,151,181,212,243,273,304,334];
    jDayNo += jmd0[jm] + sd - 1;
    final gDayNo = jDayNo + 79;
    var gy = 1600 + 400 * (gDayNo ~/ 146097);
    var gdn = gDayNo % 146097;
    var leap = true;
    if (gdn >= 36525) {
      gdn--;
      gy += 100 * (gdn ~/ 36524);
      gdn = gdn % 36524;
      if (gdn >= 365) {
        gdn++;
      } else {
        leap = false;
      }
    }
    gy += 4 * (gdn ~/ 1461);
    gdn %= 1461;
    if (gdn >= 366) {
      leap = false;
      gdn--;
      gy += gdn ~/ 365;
      gdn = gdn % 365;
    }
    final gmd = [31, leap ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    var gm = 0;
    while (gm < 11 && gdn >= gmd[gm]) { gdn -= gmd[gm]; gm++; }
    return DateTime(gy, gm + 1, gdn + 1);
  }

  static CalendarDate _gregorianToSolarHijri(DateTime dt) {
    final gy = dt.year - 1600;
    var gDayNo = 365 * gy +
        (gy + 3) ~/ 4 -
        (gy + 99) ~/ 100 +
        (gy + 399) ~/ 400;
    const gmd = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    for (var i = 0; i < dt.month - 1; i++) {
      gDayNo += (i == 1 && dt.year % 4 == 0 &&
              (dt.year % 100 != 0 || dt.year % 400 == 0))
          ? 29 : gmd[i];
    }
    gDayNo += dt.day - 1;
    final jDayNo = gDayNo - 79;
    final jNp = jDayNo ~/ 12053;
    var rem = jDayNo % 12053;
    var jy = 979 + 33 * jNp + 4 * (rem ~/ 1461);
    rem %= 1461;
    if (rem >= 366) { jy += (rem - 1) ~/ 365; rem = (rem - 1) % 365; }
    const jmd = [31,31,31,31,31,31,30,30,30,30,30,29];
    var jm = 0;
    while (jm < 11 && rem >= jmd[jm]) { rem -= jmd[jm]; jm++; }
    return CalendarDate(
      year: jy, month: jm + 1, day: rem + 1,
      calendar: CalendarSystem.solarHijri,
    );
  }

  @override
  String toString() =>
      '$year-${month.toString().padLeft(2,'0')}-${day.toString().padLeft(2,'0')} ($calendar)';
}
