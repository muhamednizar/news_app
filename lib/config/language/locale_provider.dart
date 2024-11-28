import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = const Locale('en'); // اللغة الافتراضية

  Locale get locale => _locale;

  void changeLocale(String languageCode) {
    _locale = Locale(languageCode);
    notifyListeners(); // تحديث واجهة المستخدم
  }
}
