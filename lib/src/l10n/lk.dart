/// App Localizations Keys
abstract final class Lk {
  static String forCode(String code) => switch (code) {
        _ => Lk.errorUnknown,
      };

  
  static const String ok = 'ok';
  static const String email = 'email';
  static const String username = 'username';
  static const String tryAgain = 'tryAgain';
  static const String proceed = 'proceed';
  static const String cancel = 'cancel';
  static const String require = 'require';
  static const String delete = 'delete';
  static const String search = 'search';

  static const String scopeInitErrorTitle = 'scopeInitErrorTitle';
  static const String scopeInitErrorSubtitle = 'scopeInitErrorSubtitle';

  static const String errorReleaseTitle = 'errorReleaseTitle';
  static const String errorReleaseBody = 'errorReleaseBody';
  static const String errorUnknown = 'errorUnknown';
  static const String errorUnexpectedTitle = 'errorUnexpectedTitle';
}
