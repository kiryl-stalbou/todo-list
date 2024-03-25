final class AuthConfiguration {
  AuthConfiguration();

  AuthConfiguration.empty();

  factory AuthConfiguration.fromUri(Uri uri) => AuthConfiguration.empty();

  @override
  String toString() => 'AuthConfig()';
}
