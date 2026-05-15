import 'package:central_asian_locale/central_asian_locale.dart';
import 'package:test/test.dart';

void main() {
  final uz = CentralAsianLocale.of(CaLocale.uzLatn);
  final kk = CentralAsianLocale.of(CaLocale.kk);
  final tg = CentralAsianLocale.of(CaLocale.tg);
  final dt = DateTime(2024, 3, 15, 14, 30, 5);

  group('Date formatting — Uzbek Latin', () {
    test('full date', () => expect(uz.date.format(dt, 'dd MMMM yyyy'), '15 Mart 2024'));
    test('short date', () => expect(uz.date.format(dt, 'dd.MM.yyyy'), '15.03.2024'));
    test('weekday full', () => expect(uz.date.format(dt, 'EEEE'), 'Juma'));
    test('weekday short', () => expect(uz.date.format(dt, 'EEE'), 'Ju'));
    test('time 24h', () => expect(uz.date.format(dt, 'HH:mm'), '14:30'));
    test('time 12h', () => expect(uz.date.format(dt, 'hh:mm a'), '02:30 TK'));
    test('ordinal', () => expect(uz.date.formatOrdinal(5), '5-nchi'));
  });

  group('Relative time — Uzbek', () {
    test('past hours', () {
      final past = DateTime.now().subtract(const Duration(hours: 3));
      expect(uz.date.formatRelative(past), '3 soat oldin');
    });
    test('future days', () {
      final future = DateTime.now().add(const Duration(hours: 49));
      expect(uz.date.formatRelative(future), '2 kundan keyin');
    });
  });

  group('Kazakh', () {
    test('month name', () => expect(kk.date.format(DateTime(2024, 3), 'MMMM'), 'Наурыз'));
    test('ordinal soft', () => expect(kk.date.formatOrdinal(2), '2-ші'));
    test('ordinal hard', () => expect(kk.date.formatOrdinal(1), '1-шы'));
  });

  group('Hijri calendar', () {
    test('round-trip', () {
      final original = DateTime(2024, 5, 10);
      final hijri = CalendarDate.fromDateTime(original, CalendarSystem.hijri);
      final back = hijri.toDateTime();
      expect(back.difference(original).inDays.abs(), lessThanOrEqualTo(1));
    });
  });
}
