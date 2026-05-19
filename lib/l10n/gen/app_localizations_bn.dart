// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'উইজেট গ্যালারি';

  @override
  String get homeIntro =>
      'জেনেরিক, পুনঃব্যবহারযোগ্য Flutter উইজেট। যেকোনো উইজেটে ট্যাপ করে লাইভ প্রিভিউ দেখুন ও সোর্স কোড কপি করুন।';

  @override
  String get searchHint => 'উইজেট খুঁজুন';

  @override
  String widgetCountLabel(int count) {
    return '$countটি উইজেট';
  }

  @override
  String get noResults => 'আপনার অনুসন্ধানের সাথে কোনো উইজেট মেলেনি।';

  @override
  String get preview => 'প্রিভিউ';

  @override
  String get sourceCode => 'সোর্স কোড';

  @override
  String get copy => 'কপি';

  @override
  String get copied => 'কপি হয়েছে';

  @override
  String get copiedToClipboard => 'কোড ক্লিপবোর্ডে কপি হয়েছে';

  @override
  String get appearance => 'অ্যাপিয়ারেন্স';

  @override
  String get languageLabel => 'ভাষা';

  @override
  String get colorLabel => 'রঙ';

  @override
  String get themeLabel => 'থিম';

  @override
  String get themeSystem => 'সিস্টেম';

  @override
  String get themeLight => 'লাইট';

  @override
  String get themeDark => 'ডার্ক';

  @override
  String get done => 'সম্পন্ন';

  @override
  String get categoryButtons => 'বাটন';

  @override
  String get categoryCards => 'কার্ড';

  @override
  String get categoryInputs => 'ইনপুট';

  @override
  String get categoryFeedback => 'ফিডব্যাক';

  @override
  String get categoryDisplay => 'ডিসপ্লে';

  @override
  String get categoryOverlays => 'ওভারলে';

  @override
  String get categoryNavigation => 'নেভিগেশন';

  @override
  String get categoryForms => 'ফর্ম';

  @override
  String get categoryLayout => 'লেআউট';

  @override
  String get categoryLists => 'লিস্ট';
}
