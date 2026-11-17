import 'package:equatable/equatable.dart';

class NoteEntity extends Equatable {
  final int id;
  final String title;
  final String content;
  final int? animationIndex;
  final DateTime createdAt;
  final String category;

  const NoteEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.animationIndex,
    required this.createdAt,
    this.category = 'idea',
  });

  @override
  List<Object?> get props => [id, title, content, animationIndex, createdAt, category];
}
