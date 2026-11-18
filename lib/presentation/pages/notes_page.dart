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
      backgroundColor: const Color(0xFF101A14),
      appBar: AppBar(
        title: const Text(
          'Заметки',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.6,
            fontFamily: 'Manrope',
          ),
        ),
        surfaceTintColor: Colors.transparent,
      ),
      body: BlocBuilder<NotesBloc, NotesState>(
        builder: (context, state) {
          if (state.status == NotesStatus.failure) {
            return Center(child: Text(state.errorMessage));
          }

          if (state.notes.isEmpty) {
            if (state.status == NotesStatus.loading ||
                state.status == NotesStatus.initial) {
              return const Center(
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF79B486)),
                  ),
                ),
              );
            }

            return const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Заметок пока нет',
                  style: TextStyle(
                    color: Color(0xFFA6B6A9),
                    fontSize: 16,
                  ),
                ),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                const SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 90),
                    itemCount: state.notes.length,
                    itemBuilder: (context, index) {
                      final note = state.notes[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: NoteCard(
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
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
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
        backgroundColor: const Color(0xFF397B4D),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }
}
