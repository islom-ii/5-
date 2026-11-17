import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/extensions/context_extension.dart';
import '../../core/extensions/string_extension.dart';
import '../../domain/entities/note_entity.dart';
import '../bloc/notes_bloc.dart';
import '../bloc/notes_event.dart';
import '../widgets/lottie_picker.dart';

class NoteEditPage extends StatefulWidget {
  final NoteEntity? note;

  const NoteEditPage({super.key, this.note});

  @override
  State<NoteEditPage> createState() => _NoteEditPageState();
}

class _NoteEditPageState extends State<NoteEditPage> {
  late TextEditingController titleController;
  late TextEditingController contentController;
  int? selectedAnimation;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note?.title ?? '');
    contentController =
        TextEditingController(text: widget.note?.content ?? '');
    selectedAnimation = widget.note?.animationIndex;
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  void saveNote() {
    if (titleController.text.isBlank) {
      context.showMessage('Введите заголовок');
      return;
    }

    final note = NoteEntity(
      id: widget.note?.id ?? 0,
      title: titleController.text.trim(),
      content: contentController.text.trim(),
      animationIndex: selectedAnimation,
      createdAt: widget.note?.createdAt ?? DateTime.now(),
    );

    if (widget.note == null) {
      context.read<NotesBloc>().add(AddNoteEvent(note));
    } else {
      context.read<NotesBloc>().add(UpdateNoteEvent(note));
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.note != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Редактирование' : 'Новая заметка'),
        actions: [
          IconButton(
            onPressed: saveNote,
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Заголовок',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: contentController,
              maxLines: 6,
              decoration: const InputDecoration(
                labelText: 'Текст заметки',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Анимация',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            LottiePicker(
              selectedIndex: selectedAnimation,
              onSelected: (value) {
                setState(() {
                  selectedAnimation = value;
                });
              },
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: saveNote,
                child: Text(isEdit ? 'Сохранить' : 'Создать'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
