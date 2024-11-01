class Task {
  final int id;
  final String title;
  final String description;
  final bool completed;
  final String updatedAt;
  final int userId;
  final int categoryId;
  final int priorityId;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.completed,
    required this.updatedAt,
    required this.userId,
    required this.categoryId,
    required this.priorityId,
  });
}
