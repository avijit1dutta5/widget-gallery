# Widget Gallery — Native Android (Kotlin + Jetpack Compose)

A full native-Android port of the Flutter `widget_gallery` app. Same
MVVM + clean architecture, same 45 gallery entries (41 reusable
components), multi-language (en / bn / hi), multi-color theme flavors,
syntax-highlighted code view, and entrance animations.

This is a **standalone** Gradle project. It lives next to (not inside)
Flutter's `android/` host module so the Flutter build is never touched.

## Open / build

```bash
# From Android Studio: File ▸ Open ▸ select the android_native/ folder
# Or from the command line:
cd android_native
./gradlew assembleDebug      # build APK
./gradlew installDebug       # install on a connected device/emulator
```

Requirements: Android Studio (Ladybug+), JDK 17, Android SDK 35.
First sync downloads Gradle 8.11.1 + the Compose dependencies.

## Architecture (mirrors the Flutter app)

```
domain/      Entities, repository interface, use cases (pure Kotlin)
data/        Model, local data source, repository impl, generated snippets
di/          ServiceLocator (manual DI)
presentation/
  viewmodel/ GalleryHomeViewModel (Compose state, MVVM)
  state/     AppSettings (language / flavor / theme) + CompositionLocals
  i18n/      Strings provider for English / বাংলা / हिन्दी
  theme/     Seed-based Material 3 light/dark color schemes
  codeview/  Kotlin syntax highlighter + code-editor CodeView
  components/ 41 reusable @Composable widgets (one file each)
  preview/   WidgetPreviewRegistry — live, interactive previews
  anim/      FadeSlideIn entrance animation
  screens/   GalleryHomeScreen, WidgetDetailScreen, SettingsSheet
MainActivity.kt  Compose root, navigation, theme + locale providers
```

## Keeping copy-code in sync

`data/WidgetSourceSnippets.kt` is generated from the component sources so
the "Copy" button always returns the real widget code:

```bash
python3 tools/gen_snippets.py
```

Run it again whenever you add or edit a component.

## Notes / limitations

- This project was authored without a local Android SDK to compile
  against, so it has **not been Gradle-built/verified here** — run a
  Gradle sync in Android Studio and fix any version nudges it suggests
  (Compose BOM / AGP are pinned in `gradle/libs.versions.toml`).
- `ImageCard` renders a themed gradient placeholder to stay
  dependency-free. Add Coil (`io.coil-kt:coil-compose`) and swap in
  `AsyncImage` to load real network images.
- Language switching uses an in-app `Strings` provider (like Flutter's
  generated localizations) rather than `values-bn/` resources, so it
  applies instantly with no Activity recreation.
- A couple of Material 3 APIs (`menuAnchor`) may emit deprecation
  warnings depending on the resolved Compose version; they still work.
