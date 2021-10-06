import 'package:flutter/material.dart';

class LocalizationProvider with ChangeNotifier {
  Locale _locale = Locale('en', '');

  Locale get locale => _locale;

  set locale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }


  LocalizationProvider() {
    _locale = Locale('es', 'es');
  }
}
