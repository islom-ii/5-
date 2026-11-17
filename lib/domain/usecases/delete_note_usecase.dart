import '../../core/base/base_usecase.dart';
import '../repositories/note_repository.dart';

class DeleteNoteUseCase extends BaseUseCase<void, int> {
  final NoteRepository repository;

  DeleteNoteUseCase(this.repository);

  @override
  Future<void> call(int params) {
    return repository.delete(params);
  }
}
