import 'package:flutter/material.dart';

/// A horizontal multi-step progress indicator for wizards / checkouts.
class StepProgress extends StatelessWidget {
  const StepProgress({
    super.key,
    required this.steps,
    required this.currentStep,
  });

  /// Short step labels.
  final List<String> steps;

  /// Zero-based index of the active step.
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        for (var i = 0; i < steps.length; i++) ...[
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 240),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: i <= currentStep
                      ? scheme.primary
                      : scheme.surfaceContainerHighest,
                ),
                child: Center(
                  child: i < currentStep
                      ? Icon(Icons.check,
                          size: 16, color: scheme.onPrimary)
                      : Text(
                          '${i + 1}',
                          style: TextStyle(
                            color: i == currentStep
                                ? scheme.onPrimary
                                : scheme.onSurfaceVariant,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                steps[i],
                style: TextStyle(
                  fontSize: 11,
                  color: i <= currentStep
                      ? scheme.primary
                      : scheme.onSurfaceVariant,
                  fontWeight:
                      i == currentStep ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
          if (i != steps.length - 1)
            Expanded(
              child: Container(
                height: 2,
                margin: const EdgeInsets.only(bottom: 22),
                color: i < currentStep
                    ? scheme.primary
                    : scheme.outlineVariant,
              ),
            ),
        ],
      ],
    );
  }
}
