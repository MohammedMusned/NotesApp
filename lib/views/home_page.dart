import 'package:comerce_app/Constants/colors.dart';
import 'package:comerce_app/providers/notes_provider.dart';
import 'package:comerce_app/views/widgets/no_item_animation.dart';
import 'package:comerce_app/views/widgets/note_item.dart';

import 'package:comerce_app/views/widgets/show_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final notesProvider = context.watch<NotesProvider>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.60,
                minHeight: 200,
              ),
              context: context,
              builder: (context) {
                return ShowSheet();
              });
        },
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: Row(
          children: const [
            SizedBox(
              width: 1,
            ),
            Text(
              'Notes',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: backGroundColor,
      body: notesProvider.notes.isEmpty
          ? const Center(
              child: NoItemAnimation(),
            ) // ← مؤشر تحميل
          : ListView.builder(
              itemCount: notesProvider.notes.length,
              itemBuilder: (context, index) {
                final note = notesProvider.notes[index];
                return NoteItem(
                  id: note.id!,
                  noteName: note.title,
                  noteDescription: note.content,
                );
              },
            ),
    );
  }
}
