import '../../core/base/base_usecase.dart';
import '../entities/note_entity.dart';
import '../repositories/note_repository.dart';

class AddNoteUseCase extends BaseUseCase<void, NoteEntity> {
  final NoteRepository repository;

  AddNoteUseCase(this.repository);

  @override
  Future<void> call(NoteEntity params) {
    return repository.add(params);
  }
}
