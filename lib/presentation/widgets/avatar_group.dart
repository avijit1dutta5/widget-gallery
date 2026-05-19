import 'package:flutter/material.dart';

/// Overlapping stacked avatars with a "+N" overflow chip.
class AvatarGroup extends StatelessWidget {
  const AvatarGroup({
    super.key,
    required this.names,
    this.max = 4,
    this.radius = 20,
  });

  final List<String> names;
  final int max;
  final double radius;

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts.first.isEmpty) return '?';
    if (parts.length == 1) return parts.first.characters.first.toUpperCase();
    return (parts.first.characters.first + parts.last.characters.first)
        .toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final shown = names.take(max).toList();
    final overflow = names.length - shown.length;
    final step = radius * 1.4;

    return SizedBox(
      height: radius * 2,
      width: step * (shown.length + (overflow > 0 ? 1 : 0)) + radius * 0.6,
      child: Stack(
        children: [
          for (var i = 0; i < shown.length; i++)
            Positioned(
              left: i * step,
              child: CircleAvatar(
                radius: radius + 2,
                backgroundColor: scheme.surface,
                child: CircleAvatar(
                  radius: radius,
                  backgroundColor: scheme.primaryContainer,
                  child: Text(
                    _initials(shown[i]),
                    style: TextStyle(
                      color: scheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                      fontSize: radius * 0.7,
                    ),
                  ),
                ),
              ),
            ),
          if (overflow > 0)
            Positioned(
              left: shown.length * step,
              child: CircleAvatar(
                radius: radius + 2,
                backgroundColor: scheme.surface,
                child: CircleAvatar(
                  radius: radius,
                  backgroundColor: scheme.secondaryContainer,
                  child: Text(
                    '+$overflow',
                    style: TextStyle(
                      color: scheme.onSecondaryContainer,
                      fontWeight: FontWeight.bold,
                      fontSize: radius * 0.7,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
