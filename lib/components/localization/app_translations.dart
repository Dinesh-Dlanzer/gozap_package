import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class AppTranslations {
  Locale locale;
  static Map<dynamic, dynamic>? _localisedValues;

  AppTranslations(this.locale);

  static AppTranslations? of(BuildContext context) {
    return Localizations.of<AppTranslations>(context, AppTranslations);
  }

  static Future<AppTranslations> load(Locale locale) async {
    late AppTranslations appTranslations = AppTranslations(locale);
    // String path = 'packages/gozap_package/assets/user_state.json';
    // String jobsString = await rootBundle.loadString(path);
    // List<dynamic> users = await jsonDecode(jobsString);
    String jsonContent = await rootBundle.loadString(
        "packages/gozap_package/assets/locale/localization_${locale.languageCode}.json");
    _localisedValues = json.decode(jsonContent);
    return appTranslations;
  }

  get currentLanguage => locale.languageCode;

  String text(String key) {
    if (_localisedValues != null) {
      return _localisedValues![key] ?? "$key not found";
    } else {
      return "";
    }
  }
}
