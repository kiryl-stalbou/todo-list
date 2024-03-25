/// App Localizations Keys
abstract final class Lk {
  static String forCode(String code) => switch (code) {
        _ => Lk.errorUnknown,
      };

  static const String ok = 'ok';
  static const String cancel = 'cancel';
  static const String require = 'require';
  static const String delete = 'delete';
  static const String search = 'search';


  static const String errorReleaseTitle = 'errorReleaseTitle';
  static const String errorReleaseBody = 'errorReleaseBody';
  static const String errorUnknown = 'errorUnknown';
  static const String errorUnexpectedTitle = 'errorUnexpectedTitle';
}
