import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/extensions/date_extension.dart';
import '../../core/extensions/lottie_extension.dart';
import '../../domain/entities/note_entity.dart';

class NoteCard extends StatelessWidget {
  final NoteEntity note;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const NoteCard({
    super.key,
    required this.note,
    required this.onTap,
    required this.onDelete,
  });

  String get categoryLabel {
    switch (note.category) {
      case 'work':
        return 'Работа';
      case 'personal':
        return 'Личное';
      case 'idea':
      default:
        return 'Идея';
    }
  }

  Color get categoryColor {
    switch (note.category) {
      case 'work':
        return const Color(0xFFEAF0E8);
      case 'personal':
        return const Color(0xFFE9EEF2);
      case 'idea':
      default:
        return const Color(0xFFEAF0E8);
    }
  }

  Color get categoryTextColor {
    switch (note.category) {
      case 'work':
        return const Color(0xFF5C795C);
      case 'personal':
        return const Color(0xFF647F91);
      case 'idea':
      default:
        return const Color(0xFF536B55);
    }
  }

  @override
  Widget build(BuildContext context) {
    final animationIndex = note.animationIndex;

    return Card(
      color: const Color(0xFFFFFEFA),
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: Color(0xFFEDEAE3)),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 16, 16, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                      color: categoryColor,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text(
                      categoryLabel,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                        color: categoryTextColor,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    note.createdAt.toShortString(),
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFFA1A49D),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Text(
                note.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.3,
                  fontFamily: 'Manrope',
                  color: Color(0xFF242923),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                note.content,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  height: 1.6,
                  fontSize: 12,
                  color: Color(0xFF777D73),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (animationIndex != null)
                    Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F3ED),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Lottie.asset(
                        animationIndex.lottiePath,
                        width: 22,
                        height: 22,
                        fit: BoxFit.contain,
                      ),
                    ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: onDelete,
                    splashRadius: 18,
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Color(0xFFA5A9A1),
                      size: 19,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
