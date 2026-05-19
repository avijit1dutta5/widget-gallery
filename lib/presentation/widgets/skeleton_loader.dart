import 'package:flutter/material.dart';

/// An animated shimmer placeholder used while content loads.
class SkeletonLoader extends StatefulWidget {
  const SkeletonLoader({
    super.key,
    this.width = double.infinity,
    this.height = 16,
    this.borderRadius = 8,
  });

  final double width;
  final double height;
  final double borderRadius;

  @override
  State<SkeletonLoader> createState() => _SkeletonLoaderState();
}

class _SkeletonLoaderState extends State<SkeletonLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  )..repeat();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final base = Theme.of(context).colorScheme.surfaceContainerHighest;
    final highlight = Theme.of(context).colorScheme.surfaceContainer;
    return AnimatedBuilder(
      animation: _c,
      builder: (context, _) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (rect) {
              final dx = rect.width * (_c.value * 2 - 1);
              return LinearGradient(
                colors: [base, highlight, base],
                stops: const [0.35, 0.5, 0.65],
                transform: _SlideGradient(dx),
              ).createShader(rect);
            },
            child: Container(
              width: widget.width,
              height: widget.height,
              color: base,
            ),
          ),
        );
      },
    );
  }
}

class _SlideGradient extends GradientTransform {
  const _SlideGradient(this.dx);
  final double dx;

  @override
  Matrix4 transform(Rect bounds, {TextDirection? textDirection}) =>
      Matrix4.translationValues(dx, 0, 0);
}
