class Note {
  final String id;
  final String title;
  final String description;
  final String userId;
  final DateTime createdAt;

  Note({
    required this.id,
    required this.title,
    required this.description,
    required this.userId,
    required this.createdAt,
  });

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      userId: map['userId'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
