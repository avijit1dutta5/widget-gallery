import 'package:flutter/material.dart';

import '../../domain/entities/gallery_widget.dart';
import '../../l10n/gen/app_localizations.dart';
import '../l10n_helpers.dart';
import '../viewmodels/gallery_home_viewmodel.dart';
import '../viewmodels/widget_detail_viewmodel.dart';
import '../widgets/animations.dart';
import '../widgets/app_credit.dart';
import '../widgets/app_search_bar.dart';
import 'settings_sheet.dart';
import 'widget_detail_view.dart';

/// The gallery landing page: a searchable, category-grouped grid of all
/// reusable widgets. Observes [GalleryHomeViewModel] for state.
class GalleryHomeView extends StatefulWidget {
  const GalleryHomeView({super.key, required this.viewModel});

  final GalleryHomeViewModel viewModel;

  @override
  State<GalleryHomeView> createState() => _GalleryHomeViewState();
}

class _GalleryHomeViewState extends State<GalleryHomeView> {
  GalleryHomeViewModel get _vm => widget.viewModel;

  @override
  void dispose() {
    _vm.dispose();
    super.dispose();
  }

  void _open(GalleryWidget w) {
    Navigator.of(context).push(
      fadeScaleRoute(
        WidgetDetailView(viewModel: WidgetDetailViewModel(w)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context);
    return Scaffold(
      body: ListenableBuilder(
        listenable: _vm,
        builder: (context, _) {
          final categories = _vm.visibleCategories;
          final queryKey = _vm.query;
          var globalIndex = 0;
          return CustomScrollView(
            slivers: [
              SliverAppBar.large(
                pinned: true,
                title: Text(l.appTitle),
                flexibleSpace: _GradientFlex(scheme: theme.colorScheme),
                actions: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (c, a) =>
                        ScaleTransition(scale: a, child: c),
                    child: Padding(
                      key: ValueKey(_vm.totalCount),
                      padding: const EdgeInsets.only(right: 4),
                      child: Chip(
                        label: Text(l.widgetCountLabel(_vm.totalCount)),
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: l.appearance,
                    icon: const Icon(Icons.tune_rounded),
                    onPressed: () => SettingsSheet.show(context),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l.homeIntro,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 16),
                      AppSearchBar(
                        hint: l.searchHint,
                        onChanged: _vm.search,
                      ),
                    ],
                  ),
                ),
              ),
              if (!_vm.hasResults)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: FadeSlideIn(
                    key: ValueKey('empty-$queryKey'),
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Center(child: Text(l.noResults)),
                    ),
                  ),
                )
              else
                for (final category in categories) ...[
                  SliverToBoxAdapter(
                    child: FadeSlideIn(
                      key: ValueKey('h-$category-$queryKey'),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
                        child: Row(
                          children: [
                            Container(
                              width: 4,
                              height: 22,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            Text(
                              localizedCategory(l, category),
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 280,
                        mainAxisExtent: 132,
                        crossAxisSpacing: 14,
                        mainAxisSpacing: 14,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final w = _vm.widgetsIn(category)[index];
                          final delayMs =
                              (globalIndex++ * 55).clamp(0, 700);
                          return FadeSlideIn(
                            key: ValueKey('${w.id}-$queryKey'),
                            delay: Duration(milliseconds: delayMs),
                            child: _WidgetTile(
                              item: w,
                              onTap: () => _open(w),
                            ),
                          );
                        },
                        childCount: _vm.widgetsIn(category).length,
                      ),
                    ),
                  ),
                ],
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: AppCredit(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// A soft accent gradient that fades behind the large app bar.
class _GradientFlex extends StatelessWidget {
  const _GradientFlex({required this.scheme});

  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              scheme.primary.withValues(alpha: 0.20),
              scheme.tertiary.withValues(alpha: 0.08),
              scheme.surface.withValues(alpha: 0.0),
            ],
          ),
        ),
      ),
    );
  }
}

class _WidgetTile extends StatelessWidget {
  const _WidgetTile({required this.item, required this.onTap});

  final GalleryWidget item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    const mono = 'monospace';
    return PressableScale(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: scheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: scheme.outlineVariant),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(width: 3, color: scheme.primary),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Hero(
                          tag: 'icon-${item.id}',
                          child: Text(
                            '</>',
                            style: TextStyle(
                              fontFamily: mono,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: scheme.primary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            item.title,
                            style: const TextStyle(
                              fontFamily: mono,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Text(
                        '// ${item.description}',
                        style: TextStyle(
                          fontFamily: mono,
                          fontSize: 11.5,
                          height: 1.4,
                          fontStyle: FontStyle.italic,
                          color: scheme.onSurfaceVariant,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
