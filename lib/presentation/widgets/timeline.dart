import 'package:flutter/material.dart';

class TimelineEntry {
  const TimelineEntry({
    required this.title,
    required this.subtitle,
    this.done = false,
  });

  final String title;
  final String subtitle;
  final bool done;
}

/// A vertical timeline / activity feed with connected nodes.
class Timeline extends StatelessWidget {
  const Timeline({super.key, required this.entries});

  final List<TimelineEntry> entries;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < entries.length; i++)
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: entries[i].done
                            ? scheme.primary
                            : scheme.surfaceContainerHighest,
                        shape: BoxShape.circle,
                        border: Border.all(color: scheme.primary, width: 2),
                      ),
                      child: entries[i].done
                          ? const Icon(Icons.check,
                              size: 11, color: Colors.white)
                          : null,
                    ),
                    if (i != entries.length - 1)
                      Expanded(
                        child: Container(
                          width: 2,
                          color: scheme.outlineVariant,
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entries[i].title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          entries[i].subtitle,
                          style: TextStyle(
                              color: scheme.onSurfaceVariant, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
