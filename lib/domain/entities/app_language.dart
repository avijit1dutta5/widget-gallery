/// A language the UI can be displayed in. Pure Dart — no Flutter
/// `Locale` here; the presentation layer maps [code] to a `Locale`.
enum AppLanguage {
  english('en', 'English'),
  bengali('bn', 'বাংলা'),
  hindi('hi', 'हिन्दी');

  const AppLanguage(this.code, this.nativeName);

  final String code;
  final String nativeName;

  static AppLanguage fromCode(String code) => values.firstWhere(
        (l) => l.code == code,
        orElse: () => AppLanguage.english,
      );
}
