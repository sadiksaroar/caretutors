import 'package:caretutors/core/constants/app_colors.dart';
import 'package:caretutors/features/notes/domain/note_model.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardBackground,
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              note.description,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Created: ${note.createdAt.toString().substring(0, 16)}',
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
