import 'package:flutter/material.dart';

/// Overlays a small count badge on top of any child (typically an icon).
/// The badge hides when [count] is zero and shows "99+" past 99.
class NotificationBadge extends StatelessWidget {
  const NotificationBadge({
    super.key,
    required this.child,
    required this.count,
    this.color = const Color(0xFFE53935),
  });

  final Widget child;
  final int count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        if (count > 0)
          Positioned(
            right: -6,
            top: -6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: scheme.surface, width: 2),
              ),
              child: Center(
                child: Text(
                  count > 99 ? '99+' : '$count',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
