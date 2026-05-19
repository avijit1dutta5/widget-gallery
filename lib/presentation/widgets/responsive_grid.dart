import 'package:flutter/material.dart';

/// A grid that auto-fits as many equal-width columns as possible given a
/// maximum tile width. Sizes to its content height.
class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({
    super.key,
    required this.children,
    this.maxTileWidth = 220,
    this.spacing = 12,
    this.aspectRatio = 1.4,
  });

  final List<Widget> children;
  final double maxTileWidth;
  final double spacing;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns =
            (constraints.maxWidth / maxTileWidth).ceil().clamp(1, 6);
        final tileWidth =
            (constraints.maxWidth - spacing * (columns - 1)) / columns;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            for (final child in children)
              SizedBox(
                width: tileWidth,
                height: tileWidth / aspectRatio,
                child: child,
              ),
          ],
        );
      },
    );
  }
}
