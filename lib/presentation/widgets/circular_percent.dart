import 'package:flutter/material.dart';

/// An animated circular progress ring with a centered percentage label.
class CircularPercent extends StatelessWidget {
  const CircularPercent({
    super.key,
    required this.value,
    this.size = 96,
    this.strokeWidth = 9,
    this.color,
    this.label,
  }) : assert(value >= 0 && value <= 1);

  final double value;
  final double size;
  final double strokeWidth;
  final Color? color;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final accent = color ?? scheme.primary;
    return SizedBox(
      width: size,
      height: size,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: value),
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeOutCubic,
        builder: (context, v, _) => Stack(
          alignment: Alignment.center,
          children: [
            SizedBox.expand(
              child: CircularProgressIndicator(
                value: v,
                strokeWidth: strokeWidth,
                backgroundColor: scheme.surfaceContainerHighest,
                valueColor: AlwaysStoppedAnimation(accent),
                strokeCap: StrokeCap.round,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${(v * 100).round()}%',
                  style: TextStyle(
                    fontSize: size * 0.22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (label != null)
                  Text(
                    label!,
                    style: TextStyle(
                      fontSize: size * 0.12,
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
