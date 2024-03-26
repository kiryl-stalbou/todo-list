final class TodoConfiguration {
  TodoConfiguration();

  TodoConfiguration.empty();

  // ignore: avoid_unused_constructor_parameters
  factory TodoConfiguration.fromUri(Uri uri) => TodoConfiguration.empty();

  Uri toUri() => Uri.parse('/todos');

  @override
  String toString() => 'TodoConfig()';
}
