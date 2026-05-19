import '../l10n/gen/app_localizations.dart';

/// Maps a data-layer category key to its localized display name.
String localizedCategory(AppLocalizations l, String category) {
  switch (category) {
    case 'Buttons':
      return l.categoryButtons;
    case 'Cards':
      return l.categoryCards;
    case 'Inputs':
      return l.categoryInputs;
    case 'Feedback':
      return l.categoryFeedback;
    case 'Display':
      return l.categoryDisplay;
    case 'Overlays':
      return l.categoryOverlays;
    case 'Navigation':
      return l.categoryNavigation;
    case 'Forms':
      return l.categoryForms;
    case 'Layout':
      return l.categoryLayout;
    case 'Lists':
      return l.categoryLists;
    default:
      return category;
  }
}
