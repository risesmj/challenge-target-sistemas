class TextEntity {
  final String id;
  final String content;

  TextEntity({
    required this.id,
    required this.content,
  });

  TextEntity copyWith({
    String? id,
    String? content,
  }) =>
      TextEntity(
        id: id ?? this.id,
        content: content ?? this.content,
      );
}
