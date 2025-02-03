import 'package:comerce_app/providers/notes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoteItem extends StatelessWidget {
  final int id;
  final String noteName;
  final String noteDescription;

  const NoteItem({
    super.key,
    required this.id,
    required this.noteName,
    required this.noteDescription,
  });

  @override
  Widget build(BuildContext context) {
    final notesProvider = context.read<NotesProvider>();
    return Container(
      width: 100,
      margin: EdgeInsets.all(5),
      // height: 130,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [
            Color(0xff7a306c),
            Color(0xff9a879d)
          ], // الألوان من الأزرق إلى البنفسجي
          begin: Alignment.topLeft, // بداية التدرج
          end: Alignment.bottomRight, // نهاية التدرج
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                '$noteName',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                '$noteDescription',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              trailing: IconButton(
                color: Colors.red,
                onPressed: () {
                  // Show confirmation dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Color(0xff7a306c),
                        title: Text(
                          'Confirm Deletion',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Text(
                          'Are you sure you want to delete this note?',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                          ),
                          TextButton(
                            child: Text(
                              'Delete',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            onPressed: () {
                              notesProvider.deleteNote(
                                  id); // Perform the delete operation
                              Navigator.of(context).pop(); // Close the dialog
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.delete,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
