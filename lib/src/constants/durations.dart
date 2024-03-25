// ignore_for_file: constant_identifier_names

abstract final class AppDurations {
  static const Duration _0ms = Duration.zero;
  static const Duration _100ms = Duration(milliseconds: 100);
  // static const Duration _150ms = Duration(milliseconds: 150);
  // static const Duration _200ms = Duration(milliseconds: 200);
  static const Duration _250ms = Duration(milliseconds: 250);
  static const Duration _300ms = Duration(milliseconds: 300);
  static const Duration _400ms = Duration(milliseconds: 400);
  // static const Duration _600ms = Duration(milliseconds: 600);
  static const Duration _800ms = Duration(milliseconds: 800);
  static const Duration _1000ms = Duration(milliseconds: 1000);
  static const Duration _1200ms = Duration(milliseconds: 1200);
  static const Duration _1800ms = Duration(milliseconds: 1800);

  /// 0ms
  static const Duration zero = _0ms;

  /// 100ms
  static const Duration buttonTapDelay = _100ms;

  /// 100ms
  static const Duration buttonShrink = _100ms;

  /// 250ms
  static const Duration scale = _250ms;

  /// 250ms
  static const Duration elevation = _250ms;

  /// 250ms
  static const Duration animatedListChanged = _250ms;

  /// 250ms
  static const Duration fastSlide = _250ms;

  /// 300ms
  static const Duration iconToggle = _300ms;

  /// 300ms
  static const Duration slide = _300ms;

  /// 300ms
  static const Duration dialog = _300ms;

  /// 400ms
  static const Duration expansion = _400ms;

  /// 400ms
  static const Duration fade = _400ms;

  /// 400ms
  static const Duration aestheticDelay = _400ms;

  /// 800ms
  static const Duration navigationBarAnimation = _800ms;

  /// 800ms
  static const Duration globalLoadingScreenAnimation = _800ms;

  /// 800ms
  static const Duration themeChange = _800ms;

  /// 1000ms
  static const Duration shake = _1000ms;

  /// 1000ms
  static const Duration slowSlide = _1000ms;

  /// 1000ms
  static const Duration autoScroll = _1000ms;

  /// 1200ms
  static const Duration minAppScopeInitDelay = _1200ms;

  /// 1200ms
  static const Duration minUserScopeInitDelay = _1800ms;

  /// 1800ms
  static const Duration globalLoadingScreenAnimationDelay = _1800ms;
}
