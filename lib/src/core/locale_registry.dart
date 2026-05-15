import '../locales/kk/kk_locale_data.dart';
import '../locales/ky/ky_locale_data.dart';
import '../locales/tg/tg_locale_data.dart';
import '../locales/uz_cyrl/uz_cyrl_locale_data.dart';
import '../locales/uz_latn/uz_latn_locale_data.dart';
import 'locale_data.dart';

enum CaLocale {
  uzLatn('uz-Latn-UZ'),
  uzCyrl('uz-Cyrl-UZ'),
  kk('kk-KZ'),
  tg('tg-TJ'),
  ky('ky-KG');

  const CaLocale(this.tag);
  final String tag;

  static CaLocale? fromTag(String tag) {
    final lower = tag.toLowerCase();
    for (final locale in values) {
      if (locale.tag.toLowerCase() == lower) return locale;
    }
    return null;
  }
}

final class LocaleRegistry {
  LocaleRegistry._();

  static const _instances = <CaLocale, LocaleData>{
    CaLocale.uzLatn: UzLatnLocaleData(),
    CaLocale.uzCyrl: UzCyrlLocaleData(),
    CaLocale.kk: KkLocaleData(),
    CaLocale.tg: TgLocaleData(),
    CaLocale.ky: KyLocaleData(),
  };

  static LocaleData get(CaLocale locale) => _instances[locale]!;

  static LocaleData? fromTag(String tag) {
    final caLocale = CaLocale.fromTag(tag);
    return caLocale != null ? _instances[caLocale] : null;
  }
}
