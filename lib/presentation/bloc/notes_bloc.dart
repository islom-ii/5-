import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/base/base_usecase.dart';
import '../../domain/usecases/add_note_usecase.dart';
import '../../domain/usecases/delete_note_usecase.dart';
import '../../domain/usecases/get_notes_usecase.dart';
import '../../domain/usecases/update_note_usecase.dart';
import 'notes_event.dart';
import 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final GetNotesUseCase getNotesUseCase;
  final AddNoteUseCase addNoteUseCase;
  final UpdateNoteUseCase updateNoteUseCase;
  final DeleteNoteUseCase deleteNoteUseCase;

  NotesBloc({
    required this.getNotesUseCase,
    required this.addNoteUseCase,
    required this.updateNoteUseCase,
    required this.deleteNoteUseCase,
  }) : super(const NotesState()) {
    on<LoadNotesEvent>(_onLoad);
    on<AddNoteEvent>(_onAdd);
    on<UpdateNoteEvent>(_onUpdate);
    on<DeleteNoteEvent>(_onDelete);
  }

  Future<void> _onLoad(LoadNotesEvent event, Emitter<NotesState> emit) async {
    emit(state.copyWith(status: NotesStatus.loading));
    try {
      final notes = await getNotesUseCase(const NoParams());
      emit(state.copyWith(status: NotesStatus.success, notes: notes));
    } catch (e) {
      emit(state.copyWith(
        status: NotesStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onAdd(AddNoteEvent event, Emitter<NotesState> emit) async {
    try {
      await addNoteUseCase(event.note);
      await _onLoad(const LoadNotesEvent(), emit);
    } catch (e) {
      emit(state.copyWith(
        status: NotesStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onUpdate(
      UpdateNoteEvent event, Emitter<NotesState> emit) async {
    try {
      await updateNoteUseCase(event.note);
      await _onLoad(const LoadNotesEvent(), emit);
    } catch (e) {
      emit(state.copyWith(
        status: NotesStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onDelete(
      DeleteNoteEvent event, Emitter<NotesState> emit) async {
    try {
      await deleteNoteUseCase(event.id);
      await _onLoad(const LoadNotesEvent(), emit);
    } catch (e) {
      emit(state.copyWith(
        status: NotesStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
