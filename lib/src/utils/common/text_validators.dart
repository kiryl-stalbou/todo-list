import '../../l10n/lk.dart';

enum TextValidator { notEmpty }

String clearNotPhone(String rawText) => rawText.replaceAll(RegExp('[-() ]'), '');
String clearSpaces(String rawText) => rawText.replaceAll(' ', '');

/// Returns null if valid, otherwise returns localized error string
String? validateNotEmpty(String? rawText) {
  final text = clearSpaces(rawText ?? '');

  if (text.isEmpty) return Lk.require;

  return null;
}
