// GENERATED: copy-paste-ready source for each gallery widget.
// Regenerate via the project's snippet generator.

/// Local data source: raw Dart source for every reusable widget,
/// keyed by a stable identifier. Pure data, no Flutter dependency.
class WidgetSourceSnippets {
  WidgetSourceSnippets._();

  static const String appAvatar = r'''
import 'package:flutter/material.dart';

/// A generic avatar that shows a network image or falls back to the
/// user's initials, with an optional online status dot.
class AppAvatar extends StatelessWidget {
  const AppAvatar({
    super.key,
    required this.name,
    this.imageUrl,
    this.radius = 28,
    this.online,
  });

  final String name;
  final String? imageUrl;
  final double radius;

  /// null = no status dot, true = green, false = grey.
  final bool? online;

  String get _initials {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts.first.isEmpty) return '?';
    if (parts.length == 1) return parts.first.characters.first.toUpperCase();
    return (parts.first.characters.first + parts.last.characters.first)
        .toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundColor: theme.colorScheme.primaryContainer,
          backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
          child: imageUrl == null
              ? Text(
                  _initials,
                  style: TextStyle(
                    fontSize: radius * 0.7,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                )
              : null,
        ),
        if (online != null)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: radius * 0.5,
              height: radius * 0.5,
              decoration: BoxDecoration(
                color: online! ? Colors.green : Colors.grey,
                shape: BoxShape.circle,
                border: Border.all(color: theme.colorScheme.surface, width: 2),
              ),
            ),
          ),
      ],
    );
  }
}
''';

  static const String appBanner = r'''
import 'package:flutter/material.dart';

enum BannerType { info, success, warning, error }

/// A generic inline status banner (info / success / warning / error)
/// with an optional dismiss button.
class AppBanner extends StatelessWidget {
  const AppBanner({
    super.key,
    required this.message,
    this.type = BannerType.info,
    this.onClose,
  });

  final String message;
  final BannerType type;
  final VoidCallback? onClose;

  ({Color bg, Color fg, IconData icon}) _style() {
    switch (type) {
      case BannerType.success:
        return (bg: const Color(0xFFE6F4EA), fg: const Color(0xFF1E7E34), icon: Icons.check_circle);
      case BannerType.warning:
        return (bg: const Color(0xFFFFF4E5), fg: const Color(0xFFB26A00), icon: Icons.warning_amber_rounded);
      case BannerType.error:
        return (bg: const Color(0xFFFDECEA), fg: const Color(0xFFC62828), icon: Icons.error);
      case BannerType.info:
        return (bg: const Color(0xFFE8F0FE), fg: const Color(0xFF1A5DC7), icon: Icons.info);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = _style();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: s.bg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: s.fg.withValues(alpha: 0.25)),
      ),
      child: Row(
        children: [
          Icon(s.icon, color: s.fg, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: s.fg, fontWeight: FontWeight.w500),
            ),
          ),
          if (onClose != null)
            InkWell(
              onTap: onClose,
              child: Icon(Icons.close, color: s.fg, size: 18),
            ),
        ],
      ),
    );
  }
}
''';

  static const String appBottomNavBar = r'''
import 'package:flutter/material.dart';

class BottomNavItem {
  const BottomNavItem({required this.icon, required this.label});

  final IconData icon;
  final String label;
}

/// A custom pill-style bottom navigation bar. The selected item expands
/// to show its label.
class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  final List<BottomNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(items.length, (i) {
          final selected = i == currentIndex;
          return GestureDetector(
            onTap: () => onTap(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 240),
              curve: Curves.easeOut,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: selected ? scheme.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Icon(
                    items[i].icon,
                    size: 22,
                    color: selected
                        ? scheme.onPrimary
                        : scheme.onSurfaceVariant,
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 240),
                    curve: Curves.easeOut,
                    child: selected
                        ? Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              items[i].label,
                              style: TextStyle(
                                color: scheme.onPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
''';

  static const String appButton = r'''
import 'package:flutter/material.dart';

/// A generic, themable primary button with optional leading icon,
/// loading state and full-width layout.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.isLoading = false,
    this.fullWidth = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isLoading;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    final child = isLoading
        ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(strokeWidth: 2.4, color: Colors.white),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[Icon(icon, size: 20), const SizedBox(width: 8)],
              Text(label),
            ],
          );

    final button = FilledButton(
      onPressed: isLoading ? null : onPressed,
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
      child: child,
    );

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}

/// A generic outlined / secondary action button.
class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.fullWidth = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    final button = OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[Icon(icon, size: 20), const SizedBox(width: 8)],
          Text(label),
        ],
      ),
    );

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}
''';

  static const String appDropdownField = r'''
import 'package:flutter/material.dart';

/// A generic labelled dropdown / select field.
class AppDropdownField<T> extends StatelessWidget {
  const AppDropdownField({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.itemLabel,
    this.prefixIcon,
  });

  final String label;
  final T? value;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final String Function(T)? itemLabel;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      initialValue: value,
      isExpanded: true,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      items: [
        for (final item in items)
          DropdownMenuItem<T>(
            value: item,
            child: Text(itemLabel?.call(item) ?? '$item'),
          ),
      ],
      onChanged: onChanged,
    );
  }
}
''';

  static const String appSearchBar = r'''
import 'package:flutter/material.dart';

/// A generic rounded search field with a clear button that appears once
/// the user has typed something.
class AppSearchBar extends StatefulWidget {
  const AppSearchBar({
    super.key,
    this.hint = 'Search',
    this.onChanged,
    this.controller,
  });

  final String hint;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  late final TextEditingController _controller =
      widget.controller ?? TextEditingController();
  bool _ownsController = false;

  @override
  void initState() {
    super.initState();
    _ownsController = widget.controller == null;
  }

  @override
  void dispose() {
    if (_ownsController) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      controller: _controller,
      onChanged: (v) {
        setState(() {});
        widget.onChanged?.call(v);
      },
      decoration: InputDecoration(
        hintText: widget.hint,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: _controller.text.isEmpty
            ? null
            : IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  _controller.clear();
                  setState(() {});
                  widget.onChanged?.call('');
                },
              ),
        filled: true,
        fillColor: theme.colorScheme.surfaceContainerHighest,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
''';

  static const String appTabBar = r'''
import 'package:flutter/material.dart';

/// A controlled segmented top tab bar with an animated selection pill.
class AppTabBar extends StatelessWidget {
  const AppTabBar({
    super.key,
    required this.tabs,
    required this.currentIndex,
    required this.onChanged,
  });

  final List<String> tabs;
  final int currentIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          for (var i = 0; i < tabs.length; i++)
            Expanded(
              child: GestureDetector(
                onTap: () => onChanged(i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOut,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: i == currentIndex
                        ? scheme.surface
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: i == currentIndex
                        ? [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 6,
                            )
                          ]
                        : null,
                  ),
                  child: Text(
                    tabs[i],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: i == currentIndex
                          ? scheme.primary
                          : scheme.onSurfaceVariant,
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
''';

  static const String appTextField = r'''
import 'package:flutter/material.dart';

/// A generic labelled text field with optional prefix icon, helper text
/// and error message.
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    this.hint,
    this.prefixIcon,
    this.helperText,
    this.errorText,
    this.controller,
    this.keyboardType,
    this.onChanged,
  });

  final String label;
  final String? hint;
  final IconData? prefixIcon;
  final String? helperText;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        helperText: helperText,
        errorText: errorText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}

/// A password field with a built-in show / hide toggle.
class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.label = 'Password',
    this.controller,
    this.onChanged,
  });

  final String label;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscured = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: _obscured,
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          icon: Icon(_obscured ? Icons.visibility_off : Icons.visibility),
          onPressed: () => setState(() => _obscured = !_obscured),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
''';

  static const String avatarGroup = r'''
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
''';

  static const String breadcrumbs = r'''
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
''';

  static const String checkboxTile = r'''
import 'package:flutter/material.dart';

/// A tappable row with a checkbox, title and optional subtitle.
class CheckboxTile extends StatelessWidget {
  const CheckboxTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.subtitle,
  });

  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Checkbox(
              value: value,
              onChanged: (v) => onChanged(v ?? false),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: theme.textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w500)),
                  if (subtitle != null)
                    Text(subtitle!,
                        style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
''';

  static const String circularPercent = r'''
import 'package:flutter/material.dart';

/// An animated circular progress ring with a centered percentage label.
class CircularPercent extends StatelessWidget {
  const CircularPercent({
    super.key,
    required this.value,
    this.size = 96,
    this.strokeWidth = 9,
    this.color,
    this.label,
  }) : assert(value >= 0 && value <= 1);

  final double value;
  final double size;
  final double strokeWidth;
  final Color? color;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final accent = color ?? scheme.primary;
    return SizedBox(
      width: size,
      height: size,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: value),
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeOutCubic,
        builder: (context, v, _) => Stack(
          alignment: Alignment.center,
          children: [
            SizedBox.expand(
              child: CircularProgressIndicator(
                value: v,
                strokeWidth: strokeWidth,
                backgroundColor: scheme.surfaceContainerHighest,
                valueColor: AlwaysStoppedAnimation(accent),
                strokeCap: StrokeCap.round,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${(v * 100).round()}%',
                  style: TextStyle(
                    fontSize: size * 0.22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (label != null)
                  Text(
                    label!,
                    style: TextStyle(
                      fontSize: size * 0.12,
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
''';

  static const String confirmDialog = r'''
import 'package:flutter/material.dart';

/// A reusable confirmation dialog. Returns `true` when confirmed,
/// `false`/`null` otherwise.
class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    this.confirmLabel = 'Confirm',
    this.cancelLabel = 'Cancel',
    this.destructive = false,
  });

  final String title;
  final String message;
  final String confirmLabel;
  final String cancelLabel;
  final bool destructive;

  static Future<bool> show(
    BuildContext context, {
    required String title,
    required String message,
    String confirmLabel = 'Confirm',
    String cancelLabel = 'Cancel',
    bool destructive = false,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (_) => ConfirmDialog(
        title: title,
        message: message,
        confirmLabel: confirmLabel,
        cancelLabel: cancelLabel,
        destructive: destructive,
      ),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return AlertDialog(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(cancelLabel),
        ),
        FilledButton(
          style: destructive
              ? FilledButton.styleFrom(backgroundColor: scheme.error)
              : null,
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(confirmLabel),
        ),
      ],
    );
  }
}
''';

  static const String datePickerField = r'''
import 'package:flutter/material.dart';

/// A read-only field that opens a date picker on tap and shows the
/// chosen date.
class DatePickerField extends StatelessWidget {
  const DatePickerField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.firstDate,
    this.lastDate,
  });

  final String label;
  final DateTime? value;
  final ValueChanged<DateTime> onChanged;
  final DateTime? firstDate;
  final DateTime? lastDate;

  String _format(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')}/'
      '${d.month.toString().padLeft(2, '0')}/${d.year}';

  Future<void> _pick(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: value ?? now,
      firstDate: firstDate ?? DateTime(now.year - 5),
      lastDate: lastDate ?? DateTime(now.year + 5),
    );
    if (picked != null) onChanged(picked);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _pick(context),
      borderRadius: BorderRadius.circular(12),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: const Icon(Icons.calendar_today_outlined),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        ),
        child: Text(
          value == null ? 'Select date' : _format(value!),
          style: TextStyle(
            color: value == null
                ? Theme.of(context).hintColor
                : Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
''';

  static const String emptyState = r'''
import 'package:flutter/material.dart';

/// A generic empty / placeholder state with an icon, title, message and
/// an optional call-to-action button.
class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.actionLabel,
    this.onAction,
  });

  final IconData icon;
  final String title;
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 48, color: theme.colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            if (actionLabel != null) ...[
              const SizedBox(height: 24),
              FilledButton(onPressed: onAction, child: Text(actionLabel!)),
            ],
          ],
        ),
      ),
    );
  }
}
''';

  static const String expandablePanel = r'''
import 'package:flutter/material.dart';

/// A generic accordion / FAQ panel that smoothly expands and collapses.
class ExpandablePanel extends StatefulWidget {
  const ExpandablePanel({
    super.key,
    required this.title,
    required this.child,
    this.initiallyExpanded = false,
  });

  final String title;
  final Widget child;
  final bool initiallyExpanded;

  @override
  State<ExpandablePanel> createState() => _ExpandablePanelState();
}

class _ExpandablePanelState extends State<ExpandablePanel> {
  late bool _expanded = widget.initiallyExpanded;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            borderRadius: BorderRadius.circular(14),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                  ),
                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 220),
                    child: const Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox(width: double.infinity),
            secondChild: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: DefaultTextStyle.merge(
                style: TextStyle(color: scheme.onSurfaceVariant),
                child: widget.child,
              ),
            ),
            crossFadeState: _expanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 240),
          ),
        ],
      ),
    );
  }
}
''';

  static const String filterChipGroup = r'''
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
''';

  static const String gradientButton = r'''
import 'package:flutter/material.dart';

/// A bold call-to-action button with a gradient fill, optional icon and
/// full-width layout.
class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.colors,
    this.fullWidth = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final List<Color>? colors;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final gradient = colors ?? [scheme.primary, scheme.tertiary];
    final enabled = onPressed != null;

    final button = Opacity(
      opacity: enabled ? 1 : 0.5,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradient),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: gradient.last.withValues(alpha: 0.4),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(14),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(icon, color: Colors.white, size: 20),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    return fullWidth
        ? SizedBox(width: double.infinity, child: button)
        : button;
  }
}
''';

  static const String imageCard = r'''
import 'package:flutter/material.dart';

/// A network-image card with a loading placeholder, error fallback and a
/// gradient title overlay.
class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.imageUrl,
    required this.title,
    this.subtitle,
    this.height = 180,
    this.onTap,
  });

  final String imageUrl;
  final String title;
  final String? subtitle;
  final double height;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: height,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return Container(
                    color: scheme.surfaceContainerHighest,
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  );
                },
                errorBuilder: (_, __, ___) => Container(
                  color: scheme.surfaceContainerHighest,
                  child: Icon(Icons.broken_image_outlined,
                      color: scheme.onSurfaceVariant, size: 40),
                ),
              ),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black87],
                  ),
                ),
              ),
              Positioned(
                left: 16,
                right: 16,
                bottom: 14,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 13),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
''';

  static const String infoCard = r'''
import 'package:flutter/material.dart';

/// A generic list-style card with a leading icon, title, subtitle and
/// an optional trailing widget. Tappable when [onTap] is provided.
class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: theme.colorScheme.onPrimaryContainer),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              if (trailing != null) ...[const SizedBox(width: 8), trailing!],
            ],
          ),
        ),
      ),
    );
  }
}
''';

  static const String keyValueTable = r'''
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
''';

  static const String labeledDivider = r'''
import 'package:flutter/material.dart';

/// A horizontal divider with centered text, e.g. "OR".
class LabeledDivider extends StatelessWidget {
  const LabeledDivider({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final line = Expanded(child: Divider(color: scheme.outlineVariant));
    return Row(
      children: [
        line,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            label,
            style: TextStyle(
              color: scheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
              fontSize: 12,
              letterSpacing: 1,
            ),
          ),
        ),
        line,
      ],
    );
  }
}
''';

  static const String labeledProgressBar = r'''
import 'package:flutter/material.dart';

/// A generic labelled progress bar with an animated fill and a
/// percentage readout.
class LabeledProgressBar extends StatelessWidget {
  const LabeledProgressBar({
    super.key,
    required this.label,
    required this.value,
    this.color,
  }) : assert(value >= 0 && value <= 1, 'value must be between 0 and 1');

  final String label;

  /// Progress in the range 0.0 – 1.0.
  final double value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = color ?? theme.colorScheme.primary;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            )),
            Text('${(value * 100).round()}%', style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            )),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: value),
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOutCubic,
            builder: (context, v, _) => LinearProgressIndicator(
              value: v,
              minHeight: 10,
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
              valueColor: AlwaysStoppedAnimation(accent),
            ),
          ),
        ),
      ],
    );
  }
}

/// A centered loading indicator with an optional message.
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(
              message!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
''';

  static const String labeledSlider = r'''
import 'package:flutter/material.dart';

/// A slider with a label and a live value readout.
class LabeledSlider extends StatelessWidget {
  const LabeledSlider({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 100,
    this.unit = '',
  });

  final String label;
  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final String unit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style: theme.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w600)),
            Text('${value.round()}$unit',
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: theme.colorScheme.primary)),
          ],
        ),
        Slider(
          value: value.clamp(min, max),
          min: min,
          max: max,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
''';

  static const String notificationBadge = r'''
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
''';

  static const String otpInput = r'''
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A fixed-length OTP / PIN entry field with auto-advancing boxes.
class OtpInput extends StatefulWidget {
  const OtpInput({
    super.key,
    this.length = 4,
    this.onCompleted,
  });

  final int length;
  final ValueChanged<String>? onCompleted;

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  late final List<TextEditingController> _controllers =
      List.generate(widget.length, (_) => TextEditingController());
  late final List<FocusNode> _nodes =
      List.generate(widget.length, (_) => FocusNode());

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final n in _nodes) {
      n.dispose();
    }
    super.dispose();
  }

  void _onChanged(int i, String v) {
    if (v.isNotEmpty && i < widget.length - 1) {
      _nodes[i + 1].requestFocus();
    } else if (v.isEmpty && i > 0) {
      _nodes[i - 1].requestFocus();
    }
    final code = _controllers.map((c) => c.text).join();
    if (code.length == widget.length) {
      widget.onCompleted?.call(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.length, (i) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: SizedBox(
            width: 52,
            child: TextField(
              controller: _controllers[i],
              focusNode: _nodes[i],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                counterText: '',
                filled: true,
                fillColor: scheme.surfaceContainerHighest,
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: scheme.primary, width: 2),
                ),
              ),
              onChanged: (v) => _onChanged(i, v),
            ),
          ),
        );
      }),
    );
  }
}
''';

  static const String priceTag = r'''
import 'package:flutter/material.dart';

/// A price label with optional struck-through original price and a
/// discount badge.
class PriceTag extends StatelessWidget {
  const PriceTag({
    super.key,
    required this.price,
    this.oldPrice,
    this.currency = '\$',
  });

  final double price;
  final double? oldPrice;
  final String currency;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final hasDiscount = oldPrice != null && oldPrice! > price;
    final percent =
        hasDiscount ? (((oldPrice! - price) / oldPrice!) * 100).round() : 0;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '$currency${price.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: scheme.primary,
          ),
        ),
        if (hasDiscount) ...[
          const SizedBox(width: 8),
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Text(
              '$currency${oldPrice!.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 15,
                color: scheme.onSurfaceVariant,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            margin: const EdgeInsets.only(bottom: 3),
            decoration: BoxDecoration(
              color: scheme.errorContainer,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              '-$percent%',
              style: TextStyle(
                color: scheme.onErrorContainer,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
''';

  static const String profileCard = r'''
import 'package:flutter/material.dart';

/// A generic profile / contact card with avatar, name, role and an
/// optional primary action button.
class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.name,
    required this.role,
    this.imageUrl,
    this.actionLabel,
    this.onAction,
  });

  final String name;
  final String role;
  final String? imageUrl;
  final String? actionLabel;
  final VoidCallback? onAction;

  String get _initials {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first.characters.first.toUpperCase();
    return (parts.first.characters.first + parts.last.characters.first)
        .toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 260,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: theme.colorScheme.primaryContainer,
            backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
            child: imageUrl == null
                ? Text(
                    _initials,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : null,
          ),
          const SizedBox(height: 16),
          Text(
            name,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            role,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          if (actionLabel != null) ...[
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: onAction,
                child: Text(actionLabel!),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
''';

  static const String quantitySelector = r'''
import 'package:flutter/material.dart';

/// A generic stepper for picking an integer quantity, clamped between
/// [min] and [max].
class QuantitySelector extends StatelessWidget {
  const QuantitySelector({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 99,
  });

  final int value;
  final ValueChanged<int> onChanged;
  final int min;
  final int max;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Btn(
            icon: Icons.remove,
            onTap: value > min ? () => onChanged(value - 1) : null,
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 180),
            transitionBuilder: (c, a) =>
                ScaleTransition(scale: a, child: c),
            child: SizedBox(
              key: ValueKey(value),
              width: 44,
              child: Text(
                '$value',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          _Btn(
            icon: Icons.add,
            onTap: value < max ? () => onChanged(value + 1) : null,
          ),
        ],
      ),
    );
  }
}

class _Btn extends StatelessWidget {
  const _Btn({required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Icon(
            icon,
            size: 20,
            color: onTap == null ? scheme.outline : scheme.onSurface,
          ),
        ),
      ),
    );
  }
}
''';

  static const String radioGroup = r'''
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
''';

  static const String ratingStars = r'''
import 'package:flutter/material.dart';

/// A star rating widget. Read-only by default; pass [onChanged] to make
/// it interactive.
class RatingStars extends StatelessWidget {
  const RatingStars({
    super.key,
    required this.rating,
    this.max = 5,
    this.size = 28,
    this.color = const Color(0xFFFFB300),
    this.onChanged,
  });

  final double rating;
  final int max;
  final double size;
  final Color color;
  final ValueChanged<int>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(max, (i) {
        final filled = i < rating.floor();
        final half = !filled && i < rating;
        final icon = filled
            ? Icons.star
            : half
                ? Icons.star_half
                : Icons.star_border;
        final star = Icon(icon, size: size, color: color);
        return onChanged == null
            ? star
            : GestureDetector(
                onTap: () => onChanged!(i + 1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: star,
                ),
              );
      }),
    );
  }
}
''';

  static const String responsiveGrid = r'''
import 'package:flutter/material.dart';

/// A grid that auto-fits as many equal-width columns as possible given a
/// maximum tile width. Sizes to its content height.
class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({
    super.key,
    required this.children,
    this.maxTileWidth = 220,
    this.spacing = 12,
    this.aspectRatio = 1.4,
  });

  final List<Widget> children;
  final double maxTileWidth;
  final double spacing;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns =
            (constraints.maxWidth / maxTileWidth).ceil().clamp(1, 6);
        final tileWidth =
            (constraints.maxWidth - spacing * (columns - 1)) / columns;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            for (final child in children)
              SizedBox(
                width: tileWidth,
                height: tileWidth / aspectRatio,
                child: child,
              ),
          ],
        );
      },
    );
  }
}
''';

  static const String sectionHeader = r'''
import 'package:flutter/material.dart';

/// A generic section header with a title, optional subtitle and an
/// optional trailing action.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.actionLabel,
    this.onAction,
  });

  final String title;
  final String? subtitle;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 4,
          height: subtitle != null ? 40 : 22,
          margin: const EdgeInsets.only(right: 12, top: 2),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ],
          ),
        ),
        if (actionLabel != null)
          TextButton(onPressed: onAction, child: Text(actionLabel!)),
      ],
    );
  }
}
''';

  static const String selectableListTile = r'''
import 'package:flutter/material.dart';

/// A list tile with a leading avatar/icon and a trailing check that
/// highlights when selected.
class SelectableListTile extends StatelessWidget {
  const SelectableListTile({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
    this.subtitle,
    this.leading,
  });

  final String title;
  final String? subtitle;
  final bool selected;
  final Widget? leading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      decoration: BoxDecoration(
        color: selected
            ? scheme.primaryContainer.withValues(alpha: 0.5)
            : scheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: selected ? scheme.primary : scheme.outlineVariant,
          width: selected ? 1.5 : 1,
        ),
      ),
      child: ListTile(
        onTap: onTap,
        leading: leading,
        title: Text(title,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: subtitle != null ? Text(subtitle!) : null,
        trailing: AnimatedScale(
          scale: selected ? 1 : 0,
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOutBack,
          child: Icon(Icons.check_circle, color: scheme.primary),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
''';

  static const String skeletonLoader = r'''
import 'package:flutter/material.dart';

/// An animated shimmer placeholder used while content loads.
class SkeletonLoader extends StatefulWidget {
  const SkeletonLoader({
    super.key,
    this.width = double.infinity,
    this.height = 16,
    this.borderRadius = 8,
  });

  final double width;
  final double height;
  final double borderRadius;

  @override
  State<SkeletonLoader> createState() => _SkeletonLoaderState();
}

class _SkeletonLoaderState extends State<SkeletonLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  )..repeat();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final base = Theme.of(context).colorScheme.surfaceContainerHighest;
    final highlight = Theme.of(context).colorScheme.surfaceContainer;
    return AnimatedBuilder(
      animation: _c,
      builder: (context, _) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (rect) {
              final dx = rect.width * (_c.value * 2 - 1);
              return LinearGradient(
                colors: [base, highlight, base],
                stops: const [0.35, 0.5, 0.65],
                transform: _SlideGradient(dx),
              ).createShader(rect);
            },
            child: Container(
              width: widget.width,
              height: widget.height,
              color: base,
            ),
          ),
        );
      },
    );
  }
}

class _SlideGradient extends GradientTransform {
  const _SlideGradient(this.dx);
  final double dx;

  @override
  Matrix4 transform(Rect bounds, {TextDirection? textDirection}) =>
      Matrix4.translationValues(dx, 0, 0);
}
''';

  static const String statCard = r'''
import 'package:flutter/material.dart';

/// A compact metric card: icon, value, label and an optional trend delta.
class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    this.trend,
    this.color,
  });

  final IconData icon;
  final String value;
  final String label;

  /// e.g. "+12.4%". Positive -> green, leading "-" -> red.
  final String? trend;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = color ?? theme.colorScheme.primary;
    final isNegative = trend != null && trend!.trim().startsWith('-');

    return Container(
      width: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: accent),
          ),
          const SizedBox(height: 16),
          Text(
            value,
            style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(label, style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          )),
          if (trend != null) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  isNegative ? Icons.trending_down : Icons.trending_up,
                  size: 16,
                  color: isNegative ? Colors.red : Colors.green,
                ),
                const SizedBox(width: 4),
                Text(
                  trend!,
                  style: TextStyle(
                    color: isNegative ? Colors.red : Colors.green,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
''';

  static const String statusBadge = r'''
import 'package:flutter/material.dart';

/// A small colored pill for statuses / labels. Pass an explicit [color]
/// or let it derive a stable color from the text.
class StatusBadge extends StatelessWidget {
  const StatusBadge({
    super.key,
    required this.label,
    this.color,
    this.icon,
  });

  final String label;
  final Color? color;
  final IconData? icon;

  Color get _resolved {
    if (color != null) return color!;
    const palette = [
      Color(0xFF1A5DC7),
      Color(0xFF1E7E34),
      Color(0xFFB26A00),
      Color(0xFFC62828),
      Color(0xFF6A1B9A),
    ];
    return palette[label.hashCode.abs() % palette.length];
  }

  @override
  Widget build(BuildContext context) {
    final c = _resolved;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: c.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[Icon(icon, size: 14, color: c), const SizedBox(width: 6)],
          Text(
            label,
            style: TextStyle(
              color: c,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

/// A removable / selectable tag chip.
class TagChip extends StatelessWidget {
  const TagChip({
    super.key,
    required this.label,
    this.selected = false,
    this.onTap,
    this.onRemove,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected
              ? theme.colorScheme.primary
              : theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: selected
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (onRemove != null) ...[
              const SizedBox(width: 6),
              InkWell(
                onTap: onRemove,
                child: Icon(
                  Icons.close,
                  size: 16,
                  color: selected
                      ? theme.colorScheme.onPrimary
                      : theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
''';

  static const String stepProgress = r'''
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
''';

  static const String swipeableListItem = r'''
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
''';

  static const String switchTile = r'''
import 'package:flutter/material.dart';

/// A settings-style row: leading icon, title, subtitle and a switch.
class SwitchTile extends StatelessWidget {
  const SwitchTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.subtitle,
    this.icon,
  });

  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: theme.colorScheme.primary),
              const SizedBox(width: 16),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: theme.textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w500)),
                  if (subtitle != null)
                    Text(subtitle!,
                        style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant)),
                ],
              ),
            ),
            Switch(value: value, onChanged: onChanged),
          ],
        ),
      ),
    );
  }
}
''';

  static const String timeline = r'''
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
''';

}
