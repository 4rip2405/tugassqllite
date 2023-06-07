import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
//import 'package:tugassqllite/models/note.dart';

class dbhelpers {
  static final dbhelpers instance = dbhelpers._();
  static Database? _database;

  dbhelpers._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initdb();
    return _database!;
  }

  Future<Database> _initdb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String pathString = path.join(documentsDirectory.path, 'todo_list.db');

    return await openDatabase(
      pathString,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT)',
        );
      },
    );
  }
}
