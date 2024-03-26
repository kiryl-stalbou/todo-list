final class TodoConfiguration {
  TodoConfiguration();

  TodoConfiguration.empty();

  // ignore: avoid_unused_constructor_parameters
  factory TodoConfiguration.fromUri(Uri uri) => TodoConfiguration.empty();

  @override
  String toString() => 'TodoConfig()';
}
