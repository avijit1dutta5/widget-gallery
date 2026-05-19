import 'package:flutter/material.dart';

/// A small colored pill for statuses / labels. Pass an explicit [color]
/// or let it derive a stable color from the text.
class StatusBadge extends StatelessWidget {
  const StatusBadge({
    super.key,
    required this.label,
    this.color,
    this.icon,
  });

  final String label;
  final Color? color;
  final IconData? icon;

  Color get _resolved {
    if (color != null) return color!;
    const palette = [
      Color(0xFF1A5DC7),
      Color(0xFF1E7E34),
      Color(0xFFB26A00),
      Color(0xFFC62828),
      Color(0xFF6A1B9A),
    ];
    return palette[label.hashCode.abs() % palette.length];
  }

  @override
  Widget build(BuildContext context) {
    final c = _resolved;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: c.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[Icon(icon, size: 14, color: c), const SizedBox(width: 6)],
          Text(
            label,
            style: TextStyle(
              color: c,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

/// A removable / selectable tag chip.
class TagChip extends StatelessWidget {
  const TagChip({
    super.key,
    required this.label,
    this.selected = false,
    this.onTap,
    this.onRemove,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected
              ? theme.colorScheme.primary
              : theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: selected
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (onRemove != null) ...[
              const SizedBox(width: 6),
              InkWell(
                onTap: onRemove,
                child: Icon(
                  Icons.close,
                  size: 16,
                  color: selected
                      ? theme.colorScheme.onPrimary
                      : theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
