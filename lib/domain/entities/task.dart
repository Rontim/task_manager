class Task {
  final int? id;
  final String title;
  final String description;
  final bool completed;
  final String updatedAt;
  final int userId;
  final int categoryId;
  final int priorityId;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.completed,
    required this.updatedAt,
    required this.userId,
    required this.categoryId,
    required this.priorityId,
  });

  Task copyWith({
    int? id,
    String? title,
    String? description,
    bool? completed,
    String? updatedAt,
    int? userId,
    int? categoryId,
    int? priorityId,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      completed: completed ?? this.completed,
      updatedAt: updatedAt ?? this.updatedAt,
      userId: userId ?? this.userId,
      categoryId: categoryId ?? this.categoryId,
      priorityId: priorityId ?? this.priorityId,
    );
  }
}
