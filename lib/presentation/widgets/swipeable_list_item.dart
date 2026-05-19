import 'package:flutter/material.dart';

/// A list row that can be swiped away to dismiss / delete.
class SwipeableListItem extends StatelessWidget {
  const SwipeableListItem({
    super.key,
    required this.itemKey,
    required this.title,
    required this.onDismissed,
    this.subtitle,
    this.leading,
  });

  final Key itemKey;
  final String title;
  final String? subtitle;
  final Widget? leading;
  final VoidCallback onDismissed;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Dismissible(
      key: itemKey,
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDismissed(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 24),
        decoration: BoxDecoration(
          color: scheme.errorContainer,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(Icons.delete_outline, color: scheme.onErrorContainer),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: scheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: scheme.outlineVariant),
        ),
        child: ListTile(
          leading: leading,
          title: Text(title,
              style: const TextStyle(fontWeight: FontWeight.w600)),
          subtitle: subtitle != null ? Text(subtitle!) : null,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14)),
        ),
      ),
    );
  }
}
