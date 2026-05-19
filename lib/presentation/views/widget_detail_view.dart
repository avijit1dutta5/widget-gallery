import 'package:flutter/material.dart';

import '../../l10n/gen/app_localizations.dart';
import '../viewmodels/widget_detail_viewmodel.dart';
import '../widgets/animations.dart';
import '../widgets/app_credit.dart';
import '../widgets/code_view.dart';
import '../widgets/dart_highlighter.dart';
import '../widgets/dotted_grid_background.dart';

/// Shows a single widget: a live, interactive preview on a design canvas
/// and the copy-paste-ready source code below. Content reveals in
/// sequence.
class WidgetDetailView extends StatelessWidget {
  const WidgetDetailView({super.key, required this.viewModel});

  final WidgetDetailViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Hero(
              tag: 'icon-${viewModel.id}',
              child: Text(
                '</>',
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                viewModel.title,
                style: const TextStyle(
                    fontFamily: 'monospace', fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          FadeSlideIn(
            delay: const Duration(milliseconds: 80),
            child: _DocComment(viewModel.description),
          ),
          const SizedBox(height: 24),
          FadeSlideIn(
            delay: const Duration(milliseconds: 180),
            child: _CodeLabel(l.preview),
          ),
          const SizedBox(height: 12),
          FadeSlideIn(
            delay: const Duration(milliseconds: 260),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: DottedGridBackground(
                child: Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(minHeight: 180),
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border:
                        Border.all(color: theme.colorScheme.outlineVariant),
                  ),
                  child: Center(child: viewModel.preview(context)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 28),
          FadeSlideIn(
            delay: const Duration(milliseconds: 360),
            child: _CodeLabel(l.sourceCode),
          ),
          const SizedBox(height: 12),
          FadeSlideIn(
            delay: const Duration(milliseconds: 440),
            child: CodeView(code: viewModel.code),
          ),
          const SizedBox(height: 12),
          const AppCredit(),
        ],
      ),
    );
  }
}

/// A `// label` style section heading. The label is its own Text so it
/// stays a single findable string.
class _CodeLabel extends StatelessWidget {
  const _CodeLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Text(
          '// ',
          style: TextStyle(
            fontFamily: 'monospace',
            fontSize: 16,
            color: scheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'monospace',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

/// Renders the widget description as a `///` doc comment block.
class _DocComment extends StatelessWidget {
  const _DocComment(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CodePalette.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: CodePalette.surface),
      ),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontFamily: 'monospace',
            fontSize: 13.5,
            height: 1.55,
            fontStyle: FontStyle.italic,
          ),
          children: [
            const TextSpan(
                text: '/// ',
                style: TextStyle(color: CodePalette.annotation)),
            TextSpan(text: text, style: const TextStyle(color: CodePalette.comment)),
          ],
        ),
      ),
    );
  }
}
