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
