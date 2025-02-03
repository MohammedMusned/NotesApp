import 'package:comerce_app/data/database_helper.dart';
import 'package:comerce_app/model/note.dart';
import 'package:flutter/material.dart';

class NotesProvider with ChangeNotifier {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  List<Note> _notes = [];

  // Load data for read only
  List<Note> get notes => _notes;

  Future<void> loadData() async {
    final data = await _databaseHelper.getAllNotes();
    _notes = data.map((note) => Note.fromMap(note)).toList();
    notifyListeners();
    /////
  }

  Future<void> addNote(Note note) async {
    await _databaseHelper.insertNote(note.toMap());
    await loadData(); // ✅ إعادة تحميل البيانات بعد الإضافة
  }

  Future<void> updateNote(Note note) async {
    await _databaseHelper.updateNote(note.toMap());
    await loadData();
  }

  Future<void> deleteNote(int id) async {
    await _databaseHelper.deleteNote(id);
    await loadData();
  }
}
