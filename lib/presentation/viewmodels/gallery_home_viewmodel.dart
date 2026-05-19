import 'package:flutter/foundation.dart';

import '../../domain/entities/gallery_widget.dart';
import '../../domain/usecases/get_categories.dart';
import '../../domain/usecases/get_gallery_widgets.dart';
import '../../domain/usecases/search_gallery_widgets.dart';

/// View model for the gallery home screen. Owns the search state and
/// exposes the filtered widgets grouped by category. UI observes it via
/// [ChangeNotifier].
class GalleryHomeViewModel extends ChangeNotifier {
  GalleryHomeViewModel({
    required GetGalleryWidgets getGalleryWidgets,
    required SearchGalleryWidgets searchGalleryWidgets,
    required GetCategories getCategories,
  })  : _getGalleryWidgets = getGalleryWidgets,
        _searchGalleryWidgets = searchGalleryWidgets,
        _getCategories = getCategories;

  final GetGalleryWidgets _getGalleryWidgets;
  final SearchGalleryWidgets _searchGalleryWidgets;
  final GetCategories _getCategories;

  String _query = '';
  String get query => _query;

  int get totalCount => _getGalleryWidgets().length;

  List<GalleryWidget> get _filtered => _searchGalleryWidgets(_query);

  bool get hasResults => _filtered.isNotEmpty;

  /// Categories that still have at least one matching widget, in order.
  List<String> get visibleCategories {
    final filteredCategories = _filtered.map((w) => w.category).toSet();
    return _getCategories()
        .where(filteredCategories.contains)
        .toList();
  }

  List<GalleryWidget> widgetsIn(String category) =>
      _filtered.where((w) => w.category == category).toList();

  void search(String value) {
    if (value == _query) return;
    _query = value;
    notifyListeners();
  }
}
