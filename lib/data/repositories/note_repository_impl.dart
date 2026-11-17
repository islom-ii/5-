import '../../core/base/base_local_data_source.dart';
import '../../domain/entities/note_entity.dart';
import '../../domain/repositories/note_repository.dart';
import '../database/app_database.dart';
import '../mappers/note_mapper.dart';

class NoteRepositoryImpl implements NoteRepository {
  final BaseLocalDataSource<NoteModel> dataSource;

  NoteRepositoryImpl(this.dataSource);

  @override
  Future<List<NoteEntity>> getAll() async {
    final list = await dataSource.getAll();
    return list.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> add(NoteEntity item) {
    return dataSource.add(item.toModel());
  }

  @override
  Future<void> update(NoteEntity item) {
    return dataSource.update(item.toModel());
  }

  @override
  Future<void> delete(int id) {
    return dataSource.delete(id);
  }
}
