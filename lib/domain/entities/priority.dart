class Priority {
  final int id;
  final String name;

  Priority({
    required this.id,
    required this.name,
  });

  @override
  String toString() {
    return 'Priority(id: $id, name: $name)';
  }
}
