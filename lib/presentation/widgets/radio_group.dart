import 'package:flutter/material.dart';

/// A vertical group of single-select options with a custom radio
/// indicator (no dependency on the Material Radio API).
class AppRadioGroup<T> extends StatelessWidget {
  const AppRadioGroup({
    super.key,
    required this.options,
    required this.value,
    required this.onChanged,
    this.optionLabel,
  });

  final List<T> options;
  final T? value;
  final ValueChanged<T> onChanged;
  final String Function(T)? optionLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final option in options)
          InkWell(
            onTap: () => onChanged(option),
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  _Indicator(selected: option == value),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      optionLabel?.call(option) ?? '$option',
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final color = selected
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.outline;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 160),
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 2),
      ),
      child: Center(
        child: AnimatedScale(
          scale: selected ? 1 : 0,
          duration: const Duration(milliseconds: 160),
          curve: Curves.easeOutBack,
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
