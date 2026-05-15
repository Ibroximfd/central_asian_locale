import '../../core/locale_data.dart';

final class UzLatnLocaleData implements LocaleData {
  const UzLatnLocaleData();

  @override
  String get tag => 'uz-Latn-UZ';

  @override
  List<String> get monthNames => const [
        '',
        'Yanvar', 'Fevral', 'Mart', 'Aprel', 'May', 'Iyun',
        'Iyul', 'Avgust', 'Sentyabr', 'Oktyabr', 'Noyabr', 'Dekabr',
      ];

  @override
  List<String> get monthNamesShort => const [
        '',
        'Yan', 'Fev', 'Mar', 'Apr', 'May', 'Iyn',
        'Iyl', 'Avg', 'Sen', 'Okt', 'Noy', 'Dek',
      ];

  @override
  List<String> get weekdayNames => const [
        'Dushanba', 'Seshanba', 'Chorshanba',
        'Payshanba', 'Juma', 'Shanba', 'Yakshanba',
      ];

  @override
  List<String> get weekdayNamesShort =>
      const ['Du', 'Se', 'Ch', 'Pa', 'Ju', 'Sh', 'Ya'];

  @override
  ({String am, String pm}) get dayPeriods => (am: 'TO', pm: 'TK');

  @override
  String get decimalSeparator => ',';

  @override
  String get groupSeparator => '\u00a0';

  @override
  String get currencyCode => 'UZS';

  @override
  String get currencySymbol => "so'm";

  @override
  bool get currencySymbolLeads => false;

  @override
  Map<String, ({String past, String future})> get relativeTimeTemplates =>
      const {
        'second': (past: '{n} soniya oldin',  future: '{n} soniyadan keyin'),
        'minute': (past: '{n} daqiqa oldin',  future: '{n} daqiqadan keyin'),
        'hour':   (past: '{n} soat oldin',    future: '{n} soatdan keyin'),
        'day':    (past: '{n} kun oldin',     future: '{n} kundan keyin'),
        'week':   (past: '{n} hafta oldin',   future: '{n} haftadan keyin'),
        'month':  (past: '{n} oy oldin',      future: '{n} oydan keyin'),
        'year':   (past: '{n} yil oldin',     future: '{n} yildan keyin'),
      };

  @override
  String ordinalSuffix(int n) => '-nchi';
}
