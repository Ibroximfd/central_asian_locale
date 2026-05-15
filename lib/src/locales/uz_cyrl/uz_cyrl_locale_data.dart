import '../../core/locale_data.dart';

final class UzCyrlLocaleData implements LocaleData {
  const UzCyrlLocaleData();

  @override
  String get tag => 'uz-Cyrl-UZ';

  @override
  List<String> get monthNames => const [
        '',
        'Январ', 'Феврал', 'Март', 'Апрел', 'Май', 'Июн',
        'Июл', 'Август', 'Сентябр', 'Октябр', 'Ноябр', 'Декабр',
      ];

  @override
  List<String> get monthNamesShort => const [
        '',
        'Янв', 'Фев', 'Мар', 'Апр', 'Май', 'Июн',
        'Июл', 'Авг', 'Сен', 'Окт', 'Ноя', 'Дек',
      ];

  @override
  List<String> get weekdayNames => const [
        'Душанба', 'Сешанба', 'Чоршанба',
        'Пайшанба', 'Жума', 'Шанба', 'Якшанба',
      ];

  @override
  List<String> get weekdayNamesShort =>
      const ['Дш', 'Сш', 'Чш', 'Пш', 'Жм', 'Шб', 'Яш'];

  @override
  ({String am, String pm}) get dayPeriods => (am: 'ТО', pm: 'ТК');

  @override
  String get decimalSeparator => ',';

  @override
  String get groupSeparator => '\u00a0';

  @override
  String get currencyCode => 'UZS';

  @override
  String get currencySymbol => 'сўм';

  @override
  bool get currencySymbolLeads => false;

  @override
  Map<String, ({String past, String future})> get relativeTimeTemplates =>
      const {
        'second': (past: '{n} сония олдин',   future: '{n} сониядан кейин'),
        'minute': (past: '{n} дақиқа олдин',  future: '{n} дақиқадан кейин'),
        'hour':   (past: '{n} соат олдин',    future: '{n} соатдан кейин'),
        'day':    (past: '{n} кун олдин',     future: '{n} кундан кейин'),
        'week':   (past: '{n} ҳафта олдин',   future: '{n} ҳафтадан кейин'),
        'month':  (past: '{n} ой олдин',      future: '{n} ойдан кейин'),
        'year':   (past: '{n} йил олдин',     future: '{n} йилдан кейин'),
      };

  @override
  String ordinalSuffix(int n) => '-нчи';
}
