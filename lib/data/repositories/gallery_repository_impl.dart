import '../../domain/entities/gallery_widget.dart';
import '../../domain/repositories/gallery_repository.dart';
import '../datasources/gallery_local_data_source.dart';

/// Concrete [GalleryRepository] backed by the in-memory local data source.
class GalleryRepositoryImpl implements GalleryRepository {
  const GalleryRepositoryImpl(this._localDataSource);

  final GalleryLocalDataSource _localDataSource;

  @override
  List<GalleryWidget> getWidgets() =>
      _localDataSource.getWidgets().map((m) => m.toEntity()).toList();
}
