import '../entities/gallery_widget.dart';

/// Abstraction over the source of gallery widgets. The domain layer
/// depends on this interface, never on a concrete implementation.
abstract class GalleryRepository {
  List<GalleryWidget> getWidgets();
}
