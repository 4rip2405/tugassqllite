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
  Future<void> deleteNote(Note note) async {
    await DatabaseHelper.instance.delete(note);
    _notes.removeWhere((n) => n.id == note.id);
    notifyListeners();
  }
    Future<void> editNote(Note note) async {
    await DatabaseHelper.instance.edit(note);
    int index = _notes.indexWhere((n) => n.id == note.id);
        if (index != -1) {
      _notes[index] = note;
      notifyListeners();
    }

  }
}


