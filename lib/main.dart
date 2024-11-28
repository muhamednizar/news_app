import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/language/locale_provider.dart';
import 'my_app.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
      child: const MyApp(),
    ),
  );
}
