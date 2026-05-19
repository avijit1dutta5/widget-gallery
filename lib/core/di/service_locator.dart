import '../../data/datasources/gallery_local_data_source.dart';
import '../../data/repositories/gallery_repository_impl.dart';
import '../../domain/repositories/gallery_repository.dart';
import '../../domain/usecases/get_categories.dart';
import '../../domain/usecases/get_gallery_widgets.dart';
import '../../domain/usecases/search_gallery_widgets.dart';
import '../../presentation/viewmodels/gallery_home_viewmodel.dart';

/// Minimal manual dependency-injection container. Wires the data,
/// domain and presentation layers together without any external package.
class ServiceLocator {
  ServiceLocator._();

  static final ServiceLocator instance = ServiceLocator._();

  late final GalleryRepository _repository =
      GalleryRepositoryImpl(const GalleryLocalDataSource());

  late final GetGalleryWidgets _getGalleryWidgets =
      GetGalleryWidgets(_repository);
  late final SearchGalleryWidgets _searchGalleryWidgets =
      SearchGalleryWidgets(_repository);
  late final GetCategories _getCategories = GetCategories(_repository);

  GalleryHomeViewModel createGalleryHomeViewModel() => GalleryHomeViewModel(
        getGalleryWidgets: _getGalleryWidgets,
        searchGalleryWidgets: _searchGalleryWidgets,
        getCategories: _getCategories,
      );
}
