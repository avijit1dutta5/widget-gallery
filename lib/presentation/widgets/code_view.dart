import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../l10n/gen/app_localizations.dart';
import 'dart_highlighter.dart';

const _codeStyle = TextStyle(
  fontFamily: 'monospace',
  fontFamilyFallback: ['Menlo', 'Consolas', 'Roboto Mono'],
  fontSize: 13,
  height: 1.55,
);

/// A code-editor styled panel: window chrome, a line-number gutter and
/// syntax-highlighted, selectable Dart source with one-tap copy.
class CodeView extends StatefulWidget {
  const CodeView({super.key, required this.code});

  final String code;

  @override
  State<CodeView> createState() => _CodeViewState();
}

class _CodeViewState extends State<CodeView> {
  bool _copied = false;

  Future<void> _copy() async {
    await Clipboard.setData(ClipboardData(text: widget.code));
    if (!mounted) return;
    setState(() => _copied = true);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context).copiedToClipboard),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _copied = false);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final lineCount = '\n'.allMatches(widget.code).length + 1;
    final gutter = [
      for (var i = 1; i <= lineCount; i++) '$i',
    ].join('\n');

    return Container(
      decoration: BoxDecoration(
        color: CodePalette.background,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: CodePalette.surface),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _WindowBar(
            copied: _copied,
            copyLabel: _copied ? l.copied : l.copy,
            onCopy: _copy,
          ),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 16, 12, 16),
                  color: CodePalette.background,
                  child: Text(
                    gutter,
                    textAlign: TextAlign.right,
                    style: _codeStyle.copyWith(color: CodePalette.gutter),
                  ),
                ),
                Container(width: 1, color: CodePalette.surface),
                Expanded(
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(16),
                      child: SelectableText.rich(
                        TextSpan(
                          style: _codeStyle.copyWith(
                              color: CodePalette.text),
                          children: highlightDart(widget.code),
                        ),
                      ),
                    ),
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

class _WindowBar extends StatelessWidget {
  const _WindowBar({
    required this.copied,
    required this.copyLabel,
    required this.onCopy,
  });

  final bool copied;
  final String copyLabel;
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
      decoration: const BoxDecoration(
        color: CodePalette.background,
        border: Border(bottom: BorderSide(color: CodePalette.surface)),
      ),
      child: Row(
        children: [
          const _Dot(Color(0xFFFF5F56)),
          const SizedBox(width: 8),
          const _Dot(Color(0xFFFFBD2E)),
          const SizedBox(width: 8),
          const _Dot(Color(0xFF27C93F)),
          const SizedBox(width: 16),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: CodePalette.surface,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              'widget.dart',
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 12,
                color: CodePalette.text,
              ),
            ),
          ),
          const Spacer(),
          TextButton.icon(
            onPressed: onCopy,
            icon: Icon(
              copied ? Icons.check : Icons.content_copy,
              size: 15,
              color: copied ? const Color(0xFFA6E3A1) : CodePalette.text,
            ),
            label: Text(
              copyLabel,
              style: TextStyle(
                color: copied ? const Color(0xFFA6E3A1) : CodePalette.text,
                fontFamily: 'monospace',
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot(this.color);
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      );
}
