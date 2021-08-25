import 'package:flutter/material.dart';

class AppConstants {
  static const String LOGO = 'assets/images/logo/logo.svg';
  static const String LOGO_WHITE = 'assets/images/logo/logo-white.svg';

  static const String SHORTS_LOGO = 'assets/images/logo/shorts.svg';

  // static const String BASE_URL = 'http://localhost:8000';
  static const String BASE_URL = 'https://restjsonapi.com';

  static const SUPPORTED_LOCALE = [
    AppConstants.EN_LOCALE,
    AppConstants.TR_LOCALE
  ];

  static const TR_LOCALE = Locale('tr', 'TR');
  static const EN_LOCALE = Locale('en', 'US');
  static const LANG_PATH = 'assets/locales';
}
