import 'package:drift/drift.dart';

import '../../core/base/base_local_data_source.dart';
import '../database/app_database.dart';

class NoteLocalDataSource implements BaseLocalDataSource<NoteModel> {
  final AppDatabase db;

  NoteLocalDataSource(this.db);

  @override
  Future<List<NoteModel>> getAll() {
    return (db.select(db.notesTable)
          ..orderBy([(t) => OrderingTerm.desc(t.id)]))
        .get();
  }

  @override
  Future<void> add(NoteModel item) async {
    await db.into(db.notesTable).insert(
      NotesTableCompanion.insert(
        title: item.title,
        content: item.content,
        category: Value(item.category),
        createdAt: item.createdAt,
        animationIndex: Value(item.animationIndex),
      ),
    );
  }

  @override
  Future<void> update(NoteModel item) async {
    await db.update(db.notesTable).replace(item);
  }

  @override
  Future<void> delete(int id) async {
    await (db.delete(db.notesTable)..where((t) => t.id.equals(id))).go();
  }
}
