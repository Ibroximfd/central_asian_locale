import 'package:central_asian_locale/central_asian_locale.dart';
import 'package:test/test.dart';

void main() {
  final uz = CentralAsianLocale.of(CaLocale.uzLatn);
  final kk = CentralAsianLocale.of(CaLocale.kk);

  group('Number formatting — Uzbek', () {
    test('grouping', () => expect(uz.number.formatNumber(1234567), '1\u00a0234\u00a0567'));
    test('decimal', () => expect(uz.number.formatNumber(1234.56, decimalPlaces: 2), '1\u00a0234,56'));
    test('currency', () => expect(uz.number.formatCurrency(15000), "15\u00a0000 so'm"));
    test('percent', () => expect(uz.number.formatPercent(0.856), '85,60%'));
    test('no grouping', () => expect(uz.number.formatNumber(1234567, useGrouping: false), '1234567'));
  });

  group('Currency — Kazakh', () {
    test('KZT symbol', () => expect(kk.number.formatCurrency(50000), '50\u00a0000 ₸'));
  });

  group('Static helpers', () {
    test('formatDate', () {
      final r = CentralAsianLocale.formatDate(DateTime(2024, 9, 1), 'dd MMMM yyyy', locale: CaLocale.uzLatn);
      expect(r, '01 Sentyabr 2024');
    });
    test('formatCurrency Cyrillic', () {
      final r = CentralAsianLocale.formatCurrency(75000, locale: CaLocale.uzCyrl);
      expect(r, '75\u00a0000 сўм');
    });
  });
}
