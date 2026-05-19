import 'package:flutter/material.dart';

class KeyValue {
  const KeyValue(this.label, this.value);
  final String label;
  final String value;
}

/// A label / value spec table, useful for detail and summary screens.
class KeyValueTable extends StatelessWidget {
  const KeyValueTable({super.key, required this.rows});

  final List<KeyValue> rows;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: scheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Column(
        children: [
          for (var i = 0; i < rows.length; i++)
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                border: i == rows.length - 1
                    ? null
                    : Border(
                        bottom:
                            BorderSide(color: scheme.outlineVariant)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      rows[i].label,
                      style: TextStyle(color: scheme.onSurfaceVariant),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      rows[i].value,
                      textAlign: TextAlign.right,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
