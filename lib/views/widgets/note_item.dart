import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  final String noteName;
  final String noteDescription;

  const NoteItem(
      {super.key, required this.noteName, required this.noteDescription});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      // height: 130,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 204, 195, 195),
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
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '$noteDescription',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
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
