abstract interface class LocaleData {
  String get tag;
  List<String> get monthNames;
  List<String> get monthNamesShort;
  List<String> get weekdayNames;
  List<String> get weekdayNamesShort;
  ({String am, String pm}) get dayPeriods;
  String get decimalSeparator;
  String get groupSeparator;
  String get currencyCode;
  String get currencySymbol;
  bool get currencySymbolLeads;
  Map<String, ({String past, String future})> get relativeTimeTemplates;
  String ordinalSuffix(int n);
}
