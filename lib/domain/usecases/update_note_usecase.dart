import '../../core/base/base_usecase.dart';
import '../entities/note_entity.dart';
import '../repositories/note_repository.dart';

class UpdateNoteUseCase extends BaseUseCase<void, NoteEntity> {
  final NoteRepository repository;

  UpdateNoteUseCase(this.repository);

  @override
  Future<void> call(NoteEntity params) {
    return repository.update(params);
  }
}
