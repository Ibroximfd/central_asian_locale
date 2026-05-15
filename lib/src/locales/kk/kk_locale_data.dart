import '../../core/locale_data.dart';

final class KkLocaleData implements LocaleData {
  const KkLocaleData();

  @override
  String get tag => 'kk-KZ';

  @override
  List<String> get monthNames => const [
        '',
        'Қаңтар', 'Ақпан', 'Наурыз', 'Сәуір', 'Мамыр', 'Маусым',
        'Шілде', 'Тамыз', 'Қыркүйек', 'Қазан', 'Қараша', 'Желтоқсан',
      ];

  @override
  List<String> get monthNamesShort => const [
        '',
        'Қаң', 'Ақп', 'Нау', 'Сәу', 'Мам', 'Мау',
        'Шіл', 'Там', 'Қыр', 'Қаз', 'Қар', 'Жел',
      ];

  @override
  List<String> get weekdayNames => const [
        'Дүйсенбі', 'Сейсенбі', 'Сәрсенбі',
        'Бейсенбі', 'Жұма', 'Сенбі', 'Жексенбі',
      ];

  @override
  List<String> get weekdayNamesShort =>
      const ['Дс', 'Сс', 'Ср', 'Бс', 'Жм', 'Сб', 'Жс'];

  @override
  ({String am, String pm}) get dayPeriods => (am: 'АМ', pm: 'ПМ');

  @override
  String get decimalSeparator => ',';

  @override
  String get groupSeparator => '\u00a0';

  @override
  String get currencyCode => 'KZT';

  @override
  String get currencySymbol => '₸';

  @override
  bool get currencySymbolLeads => false;

  @override
  Map<String, ({String past, String future})> get relativeTimeTemplates =>
      const {
        'second': (past: '{n} секунд бұрын', future: '{n} секундтан кейін'),
        'minute': (past: '{n} минут бұрын',  future: '{n} минуттан кейін'),
        'hour':   (past: '{n} сағат бұрын',  future: '{n} сағаттан кейін'),
        'day':    (past: '{n} күн бұрын',    future: '{n} күннен кейін'),
        'week':   (past: '{n} апта бұрын',   future: '{n} аптадан кейін'),
        'month':  (past: '{n} ай бұрын',     future: '{n} айдан кейін'),
        'year':   (past: '{n} жыл бұрын',    future: '{n} жылдан кейін'),
      };

  @override
  String ordinalSuffix(int n) {
    const soft = {'2', '3', '4', '5', '6'};
    final last = n.toString();
    return soft.contains(last[last.length - 1]) ? '-ші' : '-шы';
  }
}
