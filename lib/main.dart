import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/language/locale_provider.dart';
import 'my_app.dart'; // ملف MyApp الذي يحتوي على الكود الرئيسي للتطبيق

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LanguageProvider(), // إنشاء لغة البداية
      child: const MyApp(),
    ),
  );
}
