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
  late String selectedCategory;
  int? selectedAnimation;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note?.title ?? '');
    contentController = TextEditingController(text: widget.note?.content ?? '');
    selectedCategory = widget.note?.category ?? 'idea';
    selectedAnimation = widget.note?.animationIndex ?? 0;
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
      category: selectedCategory,
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
      backgroundColor: const Color(0xFF101A14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF101A14),
        title: Text(
          isEdit ? 'Редактирование' : 'Новая заметка',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: 'Manrope',
            color: Color(0xFFE7F0E9),
          ),
        ),
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
            const Text(
              'НАЗВАНИЕ',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
                color: Color(0xFFA6B6A9),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF1A281F),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF304638)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF304638)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF79B486)),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'ТЕКСТ ЗАМЕТКИ',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
                color: Color(0xFFA6B6A9),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: contentController,
              minLines: 5,
              maxLines: 8,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF1A281F),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF304638)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF304638)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF79B486)),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'КАТЕГОРИЯ',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
                color: Color(0xFFA6B6A9),
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: selectedCategory,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF1A281F),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF304638)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF304638)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF79B486)),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              ),
              items: const [
                DropdownMenuItem(value: 'idea', child: Text('Идея')),
                DropdownMenuItem(value: 'work', child: Text('Работа')),
                DropdownMenuItem(value: 'personal', child: Text('Личное')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedCategory = value;
                  });
                }
              },
            ),
            const SizedBox(height: 22),
            const Text(
              'АНИМАЦИЯ',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
                color: Color(0xFFA6B6A9),
              ),
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
              height: 48,
              child: ElevatedButton(
                onPressed: saveNote,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF397B4D),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  isEdit ? 'Сохранить заметку' : 'Создать заметку',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
