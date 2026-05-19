import '../entities/gallery_widget.dart';
import '../repositories/gallery_repository.dart';

/// Returns the widgets matching [query] (empty query returns all).
class SearchGalleryWidgets {
  const SearchGalleryWidgets(this._repository);

  final GalleryRepository _repository;

  List<GalleryWidget> call(String query) =>
      _repository.getWidgets().where((w) => w.matches(query)).toList();
}
