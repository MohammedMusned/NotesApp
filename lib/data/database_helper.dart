import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    final db = await openDatabase(
      path,
      version: 3,
      onCreate: _createDB,
    );

    // Add a check after initialization
    var result =
        await db.rawQuery("SELECT name FROM sqlite_master WHERE type='table'");
    print(
        "Tables in the database: $result"); // This will show the tables in the database

    return db;
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        content TEXT
        
      )
    ''');
    await db.execute('''
      CREATE TABLE notes1 (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        content TEXT
        
      )
    ''');
  }

  Future<void> insertNote(Map<String, dynamic> row) async {
    try {
      final db = await instance.database;
      await db.insert('notes1', row);
      print('Inserted note: $row'); // Debug print
    } on Exception catch (e) {
      print('Error inserting note: $e');
    }
  }

  // Future<List<Map<String, dynamic>>> getAllNotes() async {
  //   final db = await instance.database;
  //   return await db.query('notes');
  // }
  Future<List<Map<String, dynamic>>> getAllNotes() async {
    final db = await instance.database;
    final result = await db.query('notes1');
    // print('Fetched notes: $result'); // Debug print
    return result;
  }

  Future<int> updateNote(Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.update(
      'notes1',
      row,
      where: 'id = ?',
      whereArgs: [row['id']],
    );
  }

  Future<int> deleteNote(int id) async {
    final db = await instance.database;
    return await db.delete(
      'notes1',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

// class DatabaseHelper {
//   static Database? _db;

//   // If database is null create one if not igrone it
//   Future<Database?> get db async {
//     if (_db == null) {
//       _db = await intiDatabase();
//       return _db;
//     } else {
//       return _db;
//     }
//   }

// // Initlaze database
//   intiDatabase() async {
//     var databasesPath = await getDatabasesPath(); // Location for database
//     String path =
//         join(databasesPath, 'notesApp.db'); //daatabasePath/'notesApp.db
//     Database myDb = await openDatabase(path, onCreate: _onCreate);
//     return myDb;
//   }

// //Create tables
//   _onCreate(Database db, int version) async {
//     await db.execute(''' CREATE TABLE Notes(
//     id INTEGER AUTOINCRMENT NOT NULL PRIMARY KEY , 
//     title TEXT NOT NULL , 
//     content TEXT NOT NULL ,
    
    
    
//     )''');
//     print('=================================');
//     print('Databe created ');
//   }

//   loadData(String sql) async {
//     Database? myDb = await db;
//     var response = await myDb!.rawQuery(sql);
    
//   }
// }
