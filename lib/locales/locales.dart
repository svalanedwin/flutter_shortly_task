import 'dart:ui';

import 'package:flutter_shorlty_task/utils/helpers/shared.dart';
import 'package:get/get.dart';
part 'locale_english.dart';
class Locales extends Translations {
  static const Locale fallbackLocale = Locale('en');
  static Locale get deviceLocale => Locale(Get.deviceLocale!.languageCode);
  @override
  Map<String, Map<String, String>> get keys => {
      'en': _en,
  };
}
