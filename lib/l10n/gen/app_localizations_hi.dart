// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'विजेट गैलरी';

  @override
  String get homeIntro =>
      'जेनेरिक, पुन: प्रयोज्य Flutter विजेट। किसी भी विजेट पर टैप करके लाइव प्रीव्यू देखें और सोर्स कोड कॉपी करें।';

  @override
  String get searchHint => 'विजेट खोजें';

  @override
  String widgetCountLabel(int count) {
    return '$count विजेट';
  }

  @override
  String get noResults => 'आपकी खोज से कोई विजेट मेल नहीं खाता।';

  @override
  String get preview => 'प्रीव्यू';

  @override
  String get sourceCode => 'सोर्स कोड';

  @override
  String get copy => 'कॉपी';

  @override
  String get copied => 'कॉपी हो गया';

  @override
  String get copiedToClipboard => 'कोड क्लिपबोर्ड पर कॉपी हो गया';

  @override
  String get appearance => 'रूप';

  @override
  String get languageLabel => 'भाषा';

  @override
  String get colorLabel => 'रंग';

  @override
  String get themeLabel => 'थीम';

  @override
  String get themeSystem => 'सिस्टम';

  @override
  String get themeLight => 'लाइट';

  @override
  String get themeDark => 'डार्क';

  @override
  String get done => 'हो गया';

  @override
  String get categoryButtons => 'बटन';

  @override
  String get categoryCards => 'कार्ड';

  @override
  String get categoryInputs => 'इनपुट';

  @override
  String get categoryFeedback => 'फीडबैक';

  @override
  String get categoryDisplay => 'डिस्प्ले';

  @override
  String get categoryOverlays => 'ओवरले';

  @override
  String get categoryNavigation => 'नेविगेशन';

  @override
  String get categoryForms => 'फ़ॉर्म';

  @override
  String get categoryLayout => 'लेआउट';

  @override
  String get categoryLists => 'सूचियाँ';
}
