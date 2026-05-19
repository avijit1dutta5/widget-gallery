import '../../domain/entities/gallery_widget.dart';

/// Data-layer representation of a gallery widget. Kept separate from the
/// domain entity so the data source format can evolve independently.
class GalleryWidgetModel {
  const GalleryWidgetModel({
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
  final String code;

  GalleryWidget toEntity() => GalleryWidget(
        id: id,
        title: title,
        description: description,
        category: category,
        code: code,
      );
}
