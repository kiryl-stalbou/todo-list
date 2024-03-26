final class AuthConfiguration {
  AuthConfiguration({required this.showSignUp});

  AuthConfiguration.empty() : showSignUp = false;

  factory AuthConfiguration.fromUri(Uri uri) {
    if (uri.pathSegments.isNotEmpty && uri.pathSegments[0] == 'signup') {
      AuthConfiguration(showSignUp: true);
    }

    return AuthConfiguration.empty();
  }

  final bool showSignUp;

  Uri toUri() => Uri.parse(showSignUp ? 'signup' : 'signin');

  @override
  String toString() => 'AuthConfig()';
}
