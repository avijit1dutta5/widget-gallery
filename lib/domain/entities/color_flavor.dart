/// A selectable accent / seed color "flavor" for the app theme.
///
/// Pure Dart: the seed is stored as a 32-bit ARGB value so the domain
/// layer stays free of any Flutter dependency.
enum ColorFlavor {
  violet('Violet', 0xFF6C5CE7),
  ocean('Ocean', 0xFF0EA5E9),
  emerald('Emerald', 0xFF10B981),
  sunset('Sunset', 0xFFF97316),
  rose('Rose', 0xFFF43F5E),
  graphite('Graphite', 0xFF475569);

  const ColorFlavor(this.label, this.seedValue);

  final String label;
  final int seedValue;
}
