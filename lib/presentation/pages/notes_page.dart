import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/extensions/context_extension.dart';
import '../bloc/notes_bloc.dart';
import '../bloc/notes_event.dart';
import '../bloc/notes_state.dart';
import '../widgets/note_card.dart';
import 'note_edit_page.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Заметки'),
      ),
      body: BlocBuilder<NotesBloc, NotesState>(
        builder: (context, state) {
          if (state.status == NotesStatus.failure) {
            return Center(child: Text(state.errorMessage));
          }

          if (state.notes.isEmpty) {
            if (state.status == NotesStatus.loading ||
                state.status == NotesStatus.initial) {
              return const Center(child: CircularProgressIndicator());
            }
            return const Center(child: Text('Заметок пока нет'));
          }

          return ListView.builder(
            padding: const EdgeInsets.only(top: 8, bottom: 90),
            itemCount: state.notes.length,
            itemBuilder: (context, index) {
              final note = state.notes[index];
              return NoteCard(
                note: note,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NoteEditPage(note: note),
                    ),
                  );
                },
                onDelete: () {
                  context.read<NotesBloc>().add(DeleteNoteEvent(note.id));
                  context.showMessage('Заметка удалена');
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NoteEditPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
