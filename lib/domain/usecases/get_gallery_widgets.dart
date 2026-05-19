import '../entities/gallery_widget.dart';
import '../repositories/gallery_repository.dart';

/// Returns every widget in the gallery.
class GetGalleryWidgets {
  const GetGalleryWidgets(this._repository);

  final GalleryRepository _repository;

  List<GalleryWidget> call() => _repository.getWidgets();
}
