import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get categorySelect => 'Pick your category \nof interest';

  @override
  String get titleDrawer => 'categories';

  @override
  String get categoriesDrawer => 'categories';

  @override
  String get settingsDrawer => 'settings';
}
