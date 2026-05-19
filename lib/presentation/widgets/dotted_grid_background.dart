import 'package:flutter/material.dart';

/// A subtle dotted-grid backdrop, reminiscent of a design canvas /
/// playground. Paints behind [child].
class DottedGridBackground extends StatelessWidget {
  const DottedGridBackground({
    super.key,
    required this.child,
    this.gap = 22,
    this.dotRadius = 1.1,
  });

  final Widget child;
  final double gap;
  final double dotRadius;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DotPainter(
        color: Theme.of(context).colorScheme.outlineVariant,
        gap: gap,
        radius: dotRadius,
      ),
      child: child,
    );
  }
}

class _DotPainter extends CustomPainter {
  _DotPainter({required this.color, required this.gap, required this.radius});

  final Color color;
  final double gap;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    for (double y = gap; y < size.height; y += gap) {
      for (double x = gap; x < size.width; x += gap) {
        canvas.drawCircle(Offset(x, y), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DotPainter old) =>
      old.color != color || old.gap != gap || old.radius != radius;
}
