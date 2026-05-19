import 'package:flutter/material.dart';

import 'core/di/service_locator.dart';
import 'l10n/gen/app_localizations.dart';
import 'presentation/state/app_settings_controller.dart';
import 'presentation/views/gallery_home_view.dart';

class WidgetGalleryApp extends StatefulWidget {
  const WidgetGalleryApp({super.key});

  @override
  State<WidgetGalleryApp> createState() => _WidgetGalleryAppState();
}

class _WidgetGalleryAppState extends State<WidgetGalleryApp> {
  final AppSettingsController _settings = AppSettingsController();

  @override
  void dispose() {
    _settings.dispose();
    super.dispose();
  }

  ThemeData _theme(Brightness brightness) {
    final scheme = ColorScheme.fromSeed(
      seedColor: _settings.seedColor,
      brightness: brightness,
    );
    final base = ThemeData(useMaterial3: true, colorScheme: scheme);
    return base.copyWith(
      scaffoldBackgroundColor: scheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        scrolledUnderElevation: 0.5,
        centerTitle: false,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: scheme.inverseSurface,
        contentTextStyle: TextStyle(color: scheme.onInverseSurface),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      textTheme: base.textTheme.apply(fontFamilyFallback: const [
        'Roboto',
        'Noto Sans Bengali',
        'Noto Sans Devanagari',
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScope(
      controller: _settings,
      child: ListenableBuilder(
        listenable: _settings,
        builder: (context, _) {
          return MaterialApp(
            onGenerateTitle: (context) =>
                AppLocalizations.of(context).appTitle,
            debugShowCheckedModeBanner: false,
            themeMode: _settings.themeMode,
            theme: _theme(Brightness.light),
            darkTheme: _theme(Brightness.dark),
            themeAnimationCurve: Curves.easeOutCubic,
            themeAnimationDuration: const Duration(milliseconds: 450),
            locale: _settings.locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: GalleryHomeView(
              viewModel:
                  ServiceLocator.instance.createGalleryHomeViewModel(),
            ),
          );
        },
      ),
    );
  }
}
