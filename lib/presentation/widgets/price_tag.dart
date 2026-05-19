import 'package:flutter/material.dart';

/// A price label with optional struck-through original price and a
/// discount badge.
class PriceTag extends StatelessWidget {
  const PriceTag({
    super.key,
    required this.price,
    this.oldPrice,
    this.currency = '\$',
  });

  final double price;
  final double? oldPrice;
  final String currency;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final hasDiscount = oldPrice != null && oldPrice! > price;
    final percent =
        hasDiscount ? (((oldPrice! - price) / oldPrice!) * 100).round() : 0;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '$currency${price.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: scheme.primary,
          ),
        ),
        if (hasDiscount) ...[
          const SizedBox(width: 8),
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Text(
              '$currency${oldPrice!.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 15,
                color: scheme.onSurfaceVariant,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            margin: const EdgeInsets.only(bottom: 3),
            decoration: BoxDecoration(
              color: scheme.errorContainer,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              '-$percent%',
              style: TextStyle(
                color: scheme.onErrorContainer,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
