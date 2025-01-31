import 'package:comerce_app/Constants/colors.dart';
import 'package:comerce_app/data/note_data.dart';
import 'package:comerce_app/model/note.dart';
import 'package:comerce_app/views/widgets/note_item.dart';
import 'package:comerce_app/views/widgets/show_sheet.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        // Add shape

        onPressed: () {
          showModalBottomSheet(
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
              width: 20,
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
      body: ListView.builder(
        itemCount: noteData.length,
        itemBuilder: (context, index) {
          Note note = noteData[index] as Note;
          return NoteItem(
              noteName: note.noteName, noteDescription: note.noteDescription);
        },
      ),
    );
  }
}
