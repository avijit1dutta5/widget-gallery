import 'package:flutter/widgets.dart';

import '../../domain/entities/gallery_widget.dart';
import '../widgets/widget_preview_registry.dart';

/// View model for the widget detail screen. Pairs the domain entity with
/// its presentation-layer live preview.
class WidgetDetailViewModel {
  WidgetDetailViewModel(this.widget);

  final GalleryWidget widget;

  String get id => widget.id;
  String get title => widget.title;
  String get description => widget.description;
  String get code => widget.code;

  WidgetBuilder get preview => WidgetPreviewRegistry.previewFor(widget.id);
}
