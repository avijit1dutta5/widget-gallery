import 'package:flutter/material.dart';

import '../../domain/entities/app_language.dart';
import '../../domain/entities/color_flavor.dart';

/// App-wide appearance state: language, color flavor and theme mode.
/// MaterialApp rebuilds when this notifies.
class AppSettingsController extends ChangeNotifier {
  AppLanguage _language = AppLanguage.english;
  ColorFlavor _flavor = ColorFlavor.violet;
  ThemeMode _themeMode = ThemeMode.system;

  AppLanguage get language => _language;
  ColorFlavor get flavor => _flavor;
  ThemeMode get themeMode => _themeMode;

  Locale get locale => Locale(_language.code);
  Color get seedColor => Color(_flavor.seedValue);

  void setLanguage(AppLanguage value) {
    if (value == _language) return;
    _language = value;
    notifyListeners();
  }

  void setFlavor(ColorFlavor value) {
    if (value == _flavor) return;
    _flavor = value;
    notifyListeners();
  }

  void setThemeMode(ThemeMode value) {
    if (value == _themeMode) return;
    _themeMode = value;
    notifyListeners();
  }
}

/// Exposes the [AppSettingsController] to the widget tree so any screen
/// (e.g. the settings sheet) can read and mutate appearance settings.
class AppScope extends InheritedNotifier<AppSettingsController> {
  const AppScope({
    super.key,
    required AppSettingsController controller,
    required super.child,
  }) : super(notifier: controller);

  static AppSettingsController of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<AppScope>();
    assert(scope != null, 'AppScope not found in widget tree');
    return scope!.notifier!;
  }
}
