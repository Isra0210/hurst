import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:hurst/i18n/strings/en_us.dart';
import 'package:hurst/i18n/strings/pt_br.dart';
import 'strings/translations.dart';

class R {
  static Map<String, ITranslations> stringToLocale = {
    "en": EnUs(),
    "en_US": EnUs(),
    "pt": PtBr(),
    "pt_BR": PtBr(),
    "pt_PT": PtBr(),
  };
  static String platformLocale = kIsWeb
      ? 'pt_BR'
      : stringToLocale.containsKey(Platform.localeName)
          ? Platform.localeName
          : 'pt_BR';
  static ITranslations string = stringToLocale[platformLocale]!;

  static void load(Locale locale) {
    switch (locale.toString()) {
      case 'en':
        string = EnUs();
        break;
      case 'en_US':
        string = EnUs();
        break;
      case 'pt':
        string = PtBr();
        break;
      case 'pt_BR':
        string = PtBr();
        break;
      case 'pt_PT':
        string = PtBr();
        break;

      default:
        string = PtBr();
        break;
    }
  }
}
