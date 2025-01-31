import 'package:flutter/material.dart';

class ShowSheet extends StatefulWidget {
  const ShowSheet({super.key});

  @override
  _ShowSheetState createState() => _ShowSheetState();
}

class _ShowSheetState extends State<ShowSheet> {
  // Controllers for text fields
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
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.blue[900],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            textField('Title', titleControl),
            SizedBox(height: 30),
            textField('Content', descControl, maxLines: 5),
            SizedBox(height: 30),
            button(context, titleControl, descControl),
          ],
        ),
      ),
    );
  }
}

// Text field method
TextField textField(String title, TextEditingController controller,
    {int maxLines = 1}) {
  return TextField(
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
    TextEditingController contentController) {
  return Container(
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: TextButton(
      onPressed: () {
        print("Title: ${titleController.text}");
        print("Content: ${contentController.text}");
      },
      child: Text(
        'Save',
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    ),
  );
}
