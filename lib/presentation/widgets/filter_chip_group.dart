import 'package:flutter/material.dart';

/// A wrap of multi-selectable filter chips.
class FilterChipGroup extends StatelessWidget {
  const FilterChipGroup({
    super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
  });

  final List<String> options;
  final Set<String> selected;
  final ValueChanged<Set<String>> onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        for (final option in options)
          FilterChip(
            label: Text(option),
            selected: selected.contains(option),
            onSelected: (on) {
              final next = Set<String>.from(selected);
              if (on) {
                next.add(option);
              } else {
                next.remove(option);
              }
              onChanged(next);
            },
          ),
      ],
    );
  }
}
