import 'locale_data.dart';

final class FormatterContext {
  const FormatterContext({required this.locale});
  final LocaleData locale;
}

abstract interface class FormatterBase {
  FormatterContext get context;
}
