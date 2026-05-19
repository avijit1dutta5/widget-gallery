// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Widget Gallery';

  @override
  String get homeIntro =>
      'Generic, reusable Flutter widgets. Tap any widget to see a live preview and copy its source code.';

  @override
  String get searchHint => 'Search widgets';

  @override
  String widgetCountLabel(int count) {
    return '$count widgets';
  }

  @override
  String get noResults => 'No widgets match your search.';

  @override
  String get preview => 'Preview';

  @override
  String get sourceCode => 'Source code';

  @override
  String get copy => 'Copy';

  @override
  String get copied => 'Copied';

  @override
  String get copiedToClipboard => 'Code copied to clipboard';

  @override
  String get appearance => 'Appearance';

  @override
  String get languageLabel => 'Language';

  @override
  String get colorLabel => 'Color';

  @override
  String get themeLabel => 'Theme';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get done => 'Done';

  @override
  String get categoryButtons => 'Buttons';

  @override
  String get categoryCards => 'Cards';

  @override
  String get categoryInputs => 'Inputs';

  @override
  String get categoryFeedback => 'Feedback';

  @override
  String get categoryDisplay => 'Display';

  @override
  String get categoryOverlays => 'Overlays';

  @override
  String get categoryNavigation => 'Navigation';

  @override
  String get categoryForms => 'Forms';

  @override
  String get categoryLayout => 'Layout';

  @override
  String get categoryLists => 'Lists';
}
