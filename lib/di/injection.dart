import 'package:get_it/get_it.dart';

import '../core/base/base_local_data_source.dart';
import '../data/database/app_database.dart';
import '../data/datasources/note_local_data_source.dart';
import '../data/repositories/note_repository_impl.dart';
import '../domain/repositories/note_repository.dart';
import '../domain/usecases/add_note_usecase.dart';
import '../domain/usecases/delete_note_usecase.dart';
import '../domain/usecases/get_notes_usecase.dart';
import '../domain/usecases/update_note_usecase.dart';
import '../presentation/bloc/notes_bloc.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());

  getIt.registerLazySingleton<BaseLocalDataSource<NoteModel>>(
    () => NoteLocalDataSource(getIt<AppDatabase>()),
  );

  getIt.registerLazySingleton<NoteRepository>(
    () => NoteRepositoryImpl(getIt<BaseLocalDataSource<NoteModel>>()),
  );

  getIt.registerLazySingleton<GetNotesUseCase>(
    () => GetNotesUseCase(getIt<NoteRepository>()),
  );
  getIt.registerLazySingleton<AddNoteUseCase>(
    () => AddNoteUseCase(getIt<NoteRepository>()),
  );
  getIt.registerLazySingleton<UpdateNoteUseCase>(
    () => UpdateNoteUseCase(getIt<NoteRepository>()),
  );
  getIt.registerLazySingleton<DeleteNoteUseCase>(
    () => DeleteNoteUseCase(getIt<NoteRepository>()),
  );

  getIt.registerFactory<NotesBloc>(
    () => NotesBloc(
      getNotesUseCase: getIt<GetNotesUseCase>(),
      addNoteUseCase: getIt<AddNoteUseCase>(),
      updateNoteUseCase: getIt<UpdateNoteUseCase>(),
      deleteNoteUseCase: getIt<DeleteNoteUseCase>(),
    ),
  );
}
