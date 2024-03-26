// ignore_for_file: constant_identifier_names

abstract final class AppDurations {
  static const Duration _300ms = Duration(milliseconds: 300);
  static const Duration _400ms = Duration(milliseconds: 400);
  static const Duration _800ms = Duration(milliseconds: 800);
  static const Duration _1000ms = Duration(milliseconds: 1000);
  static const Duration _1200ms = Duration(milliseconds: 1200);
  static const Duration _1800ms = Duration(milliseconds: 1800);

  /// 300ms
  static const Duration dialog = _300ms;

  /// 300ms
  static const Duration slide = _300ms;

  /// 400ms
  static const Duration aestheticDelay = _400ms;

  /// 800ms
  static const Duration splashScreenAnimation = _800ms;

  /// 800ms
  static const Duration globalLoadingScreenAnimation = _800ms;

  /// 800ms
  static const Duration themeChange = _800ms;

  /// 1000ms
  static const Duration shake = _1000ms;

  /// 1000ms
  static const Duration autoScroll = _1000ms;

  /// 1200ms
  static const Duration minAppScopeInitDelay = _1000ms;

  /// 1200ms
  static const Duration minUserScopeInitDelay = _1000ms;

  /// 1800ms
  static const Duration globalLoadingScreenAnimationDelay = _1800ms;
}
