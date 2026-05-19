import 'package:flutter/material.dart';

/// A path breadcrumb trail. The last crumb is the current page; tapping
/// an earlier crumb reports its index.
class Breadcrumbs extends StatelessWidget {
  const Breadcrumbs({
    super.key,
    required this.crumbs,
    this.onTap,
  });

  final List<String> crumbs;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (var i = 0; i < crumbs.length; i++) ...[
          InkWell(
            onTap: i == crumbs.length - 1 ? null : () => onTap?.call(i),
            borderRadius: BorderRadius.circular(6),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Text(
                crumbs[i],
                style: TextStyle(
                  color: i == crumbs.length - 1
                      ? scheme.onSurface
                      : scheme.primary,
                  fontWeight: i == crumbs.length - 1
                      ? FontWeight.bold
                      : FontWeight.w500,
                ),
              ),
            ),
          ),
          if (i != crumbs.length - 1)
            Icon(Icons.chevron_right,
                size: 18, color: scheme.onSurfaceVariant),
        ],
      ],
    );
  }
}
