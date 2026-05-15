import '../../core/locale_data.dart';

final class TgLocaleData implements LocaleData {
  const TgLocaleData();

  @override
  String get tag => 'tg-TJ';

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
        'Душанбе', 'Сешанбе', 'Чоршанбе',
        'Панҷшанбе', 'Ҷумъа', 'Шанбе', 'Якшанбе',
      ];

  @override
  List<String> get weekdayNamesShort =>
      const ['Дш', 'Сш', 'Чш', 'Пш', 'Ҷм', 'Шб', 'Яш'];

  @override
  ({String am, String pm}) get dayPeriods => (am: 'пе', pm: 'па');

  @override
  String get decimalSeparator => ',';

  @override
  String get groupSeparator => '\u00a0';

  @override
  String get currencyCode => 'TJS';

  @override
  String get currencySymbol => 'SM';

  @override
  bool get currencySymbolLeads => false;

  @override
  Map<String, ({String past, String future})> get relativeTimeTemplates =>
      const {
        'second': (past: '{n} сония пеш',   future: 'баъди {n} сония'),
        'minute': (past: '{n} дақиқа пеш',  future: 'баъди {n} дақиқа'),
        'hour':   (past: '{n} соат пеш',    future: 'баъди {n} соат'),
        'day':    (past: '{n} рӯз пеш',     future: 'баъди {n} рӯз'),
        'week':   (past: '{n} ҳафта пеш',   future: 'баъди {n} ҳафта'),
        'month':  (past: '{n} моҳ пеш',     future: 'баъди {n} моҳ'),
        'year':   (past: '{n} сол пеш',     future: 'баъди {n} сол'),
      };

  @override
  String ordinalSuffix(int n) => '-ум';
}
