import 'package:flutter/material.dart';

/// Author credit shown at the bottom of every page.
class AppCredit extends StatelessWidget {
  const AppCredit({super.key});

  static const name = 'Avijit Dutta';
  static const email = 'avijit1dutta5@gmail.com';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Divider(color: theme.colorScheme.outlineVariant),
          const SizedBox(height: 12),
          Text(
            name,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            email,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
