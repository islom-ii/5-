import '../../domain/entities/note_entity.dart';
import '../database/app_database.dart';

extension NoteModelMapper on NoteModel {
  NoteEntity toEntity() {
    return NoteEntity(
      id: id,
      title: title,
      content: content,
      animationIndex: animationIndex,
      createdAt: createdAt,
      category: category,
    );
  }
}

extension NoteEntityMapper on NoteEntity {
  NoteModel toModel() {
    return NoteModel(
      id: id,
      title: title,
      content: content,
      animationIndex: animationIndex,
      createdAt: createdAt,
      category: category,
    );
  }
}
