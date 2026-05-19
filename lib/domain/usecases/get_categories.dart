import '../repositories/gallery_repository.dart';

/// Returns category names in first-seen order, deduplicated.
class GetCategories {
  const GetCategories(this._repository);

  final GalleryRepository _repository;

  List<String> call() {
    final seen = <String>[];
    for (final w in _repository.getWidgets()) {
      if (!seen.contains(w.category)) seen.add(w.category);
    }
    return seen;
  }
}
