import 'package:flutter/material.dart';

/// A star rating widget. Read-only by default; pass [onChanged] to make
/// it interactive.
class RatingStars extends StatelessWidget {
  const RatingStars({
    super.key,
    required this.rating,
    this.max = 5,
    this.size = 28,
    this.color = const Color(0xFFFFB300),
    this.onChanged,
  });

  final double rating;
  final int max;
  final double size;
  final Color color;
  final ValueChanged<int>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(max, (i) {
        final filled = i < rating.floor();
        final half = !filled && i < rating;
        final icon = filled
            ? Icons.star
            : half
                ? Icons.star_half
                : Icons.star_border;
        final star = Icon(icon, size: size, color: color);
        return onChanged == null
            ? star
            : GestureDetector(
                onTap: () => onChanged!(i + 1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: star,
                ),
              );
      }),
    );
  }
}
