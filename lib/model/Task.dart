class Task {
  final String id;
  String title;
  String? description;
  bool isCompleted;
  final DateTime createdAt;
  DateTime? completedAt;
  DateTime? updatedAt;

  Task({
    required this.id,
    required this.title,
    this.description,
    this.isCompleted = false,
    required this.createdAt,
    this.completedAt,
    this.updatedAt,
  });
}
