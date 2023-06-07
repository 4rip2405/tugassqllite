import 'package:flutter/foundation.dart';
import 'package:todo_list/dbhelper/DatabaseHelper.dart';
import 'package:todo_list/models/note.dart';

class NotesOperation with ChangeNotifier {
  List<Note> _notes = [];
  List<Note> get getNotes => _notes;

  Future<void> addNewNote(String title, String description) async {
    Note note = Note(
      title: title,
      description: description,
    );
    int id = await DatabaseHelper.instance.insert(note);
    note.id = id;
    _notes.add(note);
    notifyListeners();
  }

  Future<void> getNotesFromDatabase() async {
    List<Note> notes = await DatabaseHelper.instance.getNotes();
    _notes = notes;
    notifyListeners();
  }
}
