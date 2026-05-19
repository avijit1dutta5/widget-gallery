import 'package:flutter/material.dart';

/// A dark code-editor color palette (Catppuccin Mocha) shared by the
/// syntax highlighter and the code view chrome.
class CodePalette {
  CodePalette._();

  static const background = Color(0xFF1E1E2E);
  static const surface = Color(0xFF313244);
  static const gutter = Color(0xFF45475A);
  static const text = Color(0xFFCDD6F4);
  static const comment = Color(0xFF7F849C);
  static const keyword = Color(0xFFCBA6F7);
  static const string = Color(0xFFA6E3A1);
  static const number = Color(0xFFFAB387);
  static const type = Color(0xFFF9E2AF);
  static const annotation = Color(0xFF89B4FA);
  static const punctuation = Color(0xFFBAC2DE);
}

const _keywords = {
  'abstract', 'as', 'assert', 'async', 'await', 'break', 'case', 'catch',
  'class', 'const', 'continue', 'covariant', 'default', 'deferred', 'do',
  'dynamic', 'else', 'enum', 'export', 'extends', 'extension', 'external',
  'factory', 'false', 'final', 'finally', 'for', 'Function', 'get', 'hide',
  'if', 'implements', 'import', 'in', 'is', 'late', 'library', 'mixin',
  'new', 'null', 'on', 'operator', 'part', 'required', 'rethrow', 'return',
  'sealed', 'set', 'show', 'static', 'super', 'switch', 'sync', 'this',
  'throw', 'true', 'try', 'typedef', 'var', 'void', 'while', 'with', 'yield',
};

// Built as a single raw double-quoted string; literal double quotes are
// written as the regex escape \x22 so no fragile string concatenation is
// needed.
final _token = RegExp(
  r"(///[^\n]*|//[^\n]*)"
  r"|(/\*[\s\S]*?\*/)"
  r"|([rR]?'''[\s\S]*?'''|[rR]?\x22\x22\x22[\s\S]*?\x22\x22\x22)"
  r"|([rR]?'(?:\\.|[^'\\\n])*'|[rR]?\x22(?:\\.|[^\x22\\\n])*\x22)"
  r"|(@[A-Za-z_$][\w$]*)"
  r"|(\b\d[\d_]*\.?\d*\b)"
  r"|([A-Za-z_$][\w$]*)"
  r"|(\s+)"
  r"|(.)",
);

/// Tokenizes [code] and returns colored spans. Pure presentation logic,
/// no external dependency.
List<TextSpan> highlightDart(String code) {
  final spans = <TextSpan>[];
  TextStyle style(Color c, {bool italic = false}) => TextStyle(
        color: c,
        fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      );

  for (final m in _token.allMatches(code)) {
    if (m.group(1) != null || m.group(2) != null) {
      spans.add(TextSpan(
          text: m.group(0), style: style(CodePalette.comment, italic: true)));
    } else if (m.group(3) != null || m.group(4) != null) {
      spans.add(
          TextSpan(text: m.group(0), style: style(CodePalette.string)));
    } else if (m.group(5) != null) {
      spans.add(
          TextSpan(text: m.group(0), style: style(CodePalette.annotation)));
    } else if (m.group(6) != null) {
      spans.add(
          TextSpan(text: m.group(0), style: style(CodePalette.number)));
    } else if (m.group(7) != null) {
      final word = m.group(7)!;
      final Color c;
      if (_keywords.contains(word)) {
        c = CodePalette.keyword;
      } else if (word[0].toUpperCase() == word[0] &&
          word[0].toLowerCase() != word[0]) {
        c = CodePalette.type;
      } else {
        c = CodePalette.text;
      }
      spans.add(TextSpan(text: word, style: style(c)));
    } else if (m.group(8) != null) {
      spans.add(TextSpan(text: m.group(0)));
    } else {
      spans.add(
          TextSpan(text: m.group(0), style: style(CodePalette.punctuation)));
    }
  }
  return spans;
}
