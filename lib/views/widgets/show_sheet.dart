import 'package:comerce_app/Constants/colors.dart';
import 'package:comerce_app/model/note.dart';
import 'package:comerce_app/providers/notes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowSheet extends StatefulWidget {
  const ShowSheet({super.key});

  @override
  _ShowSheetState createState() => _ShowSheetState();
}

class _ShowSheetState extends State<ShowSheet> {
  // Controllers for text fields
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleControl = TextEditingController();
  TextEditingController descControl = TextEditingController();

// Clean data after used
  @override
  void dispose() {
    titleControl.dispose();
    descControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backGroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  textField('Title', titleControl),
                  SizedBox(height: 30),
                  textField('Content', descControl, maxLines: 6),
                ],
              ),
            ),
            // textField('Title', titleControl),
            // SizedBox(height: 30),
            // textField('Content', descControl, maxLines: 4),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            button(context, titleControl, descControl, _formKey),
          ],
        ),
      ),
    );
  }
}

// Text field method
TextFormField textField(String title, TextEditingController controller,
    {int maxLines = 1}) {
  return TextFormField(
    style: TextStyle(
      color: Colors.white,
    ),
    cursorColor: Colors.white,
    validator: (value) => value!.isEmpty ? 'Required' : null,
    maxLines: maxLines,
    controller: controller,
    decoration: InputDecoration(
      label: Text(title),
      labelStyle: TextStyle(
        color: Colors.white,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
    ),
  );
}

// Button to add a new note
Container button(BuildContext context, TextEditingController titleController,
    TextEditingController contentController, formKey) {
  return Container(
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: Color(0xff7a306c),
      borderRadius: BorderRadius.circular(8),
    ),
    child: TextButton(
      onPressed: () {
        final note = Note(
          title: titleController.text,
          content: contentController.text,
        );
        Provider.of<NotesProvider>(context, listen: false).addNote(note);
      },
      child: Text(
        'Save',
        style: TextStyle(
          fontSize: 25,
          color: Colors.white,
        ),
      ),
    ),
  );
}
