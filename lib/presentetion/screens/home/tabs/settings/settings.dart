import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../config/language/locale_provider.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    String selectedLanguage =
        languageProvider.locale.languageCode == 'en' ? 'English' : 'Arabic';

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Language',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedLanguage,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              items: ['English', 'Arabic']
                  .map((language) => DropdownMenuItem(
                        value: language,
                        child: Text(language),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value == 'English') {
                  languageProvider.changeLocale('en');
                } else if (value == 'Arabic') {
                  languageProvider.changeLocale('ar');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
