import '../../core/locale_data.dart';

final class KyLocaleData implements LocaleData {
  const KyLocaleData();

  @override
  String get tag => 'ky-KG';

  @override
  List<String> get monthNames => const [
        '',
        'Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь',
        'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь',
      ];

  @override
  List<String> get monthNamesShort => const [
        '',
        'Янв', 'Фев', 'Мар', 'Апр', 'Май', 'Июн',
        'Июл', 'Авг', 'Сен', 'Окт', 'Ноя', 'Дек',
      ];

  @override
  List<String> get weekdayNames => const [
        'Дүйшөмбү', 'Шейшемби', 'Шаршемби',
        'Бейшемби', 'Жума', 'Ишемби', 'Жекшемби',
      ];

  @override
  List<String> get weekdayNamesShort =>
      const ['Дш', 'Шш', 'Шр', 'Бш', 'Жм', 'Иш', 'Жш'];

  @override
  ({String am, String pm}) get dayPeriods =>
      (am: 'таңкы', pm: 'түштөн кийинки');

  @override
  String get decimalSeparator => ',';

  @override
  String get groupSeparator => '\u00a0';

  @override
  String get currencyCode => 'KGS';

  @override
  String get currencySymbol => 'с';

  @override
  bool get currencySymbolLeads => false;

  @override
  Map<String, ({String past, String future})> get relativeTimeTemplates =>
      const {
        'second': (past: '{n} секунд мурун',  future: '{n} секунддан кийин'),
        'minute': (past: '{n} мүнөт мурун',   future: '{n} мүнөттөн кийин'),
        'hour':   (past: '{n} саат мурун',    future: '{n} сааттан кийин'),
        'day':    (past: '{n} күн мурун',     future: '{n} күндөн кийин'),
        'week':   (past: '{n} жума мурун',    future: '{n} жумадан кийин'),
        'month':  (past: '{n} ай мурун',      future: '{n} айдан кийин'),
        'year':   (past: '{n} жыл мурун',     future: '{n} жылдан кийин'),
      };

  @override
  String ordinalSuffix(int n) => '-чи';
}
