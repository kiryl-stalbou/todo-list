final class TodoConfiguration {
  TodoConfiguration();

  TodoConfiguration.empty();

  factory TodoConfiguration.fromUri(Uri uri) => TodoConfiguration.empty();

  @override
  String toString() => 'TodoConfig()';
}
