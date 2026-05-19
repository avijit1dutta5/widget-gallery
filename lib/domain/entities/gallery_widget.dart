/// Domain entity describing a single reusable widget in the gallery.
///
/// Pure Dart — intentionally has no Flutter dependency. The live preview
/// is a presentation concern and is resolved by [id] in that layer.
class GalleryWidget {
  const GalleryWidget({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.code,
  });

  final String id;
  final String title;
  final String description;
  final String category;

  /// Copy-paste-ready Dart source for this widget.
  final String code;

  bool matches(String query) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return true;
    return title.toLowerCase().contains(q) ||
        description.toLowerCase().contains(q) ||
        category.toLowerCase().contains(q);
  }
}
