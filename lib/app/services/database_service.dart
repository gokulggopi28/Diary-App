import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'diary.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE diary_entries (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            content TEXT,
            date TEXT
          )
        ''');
      },
    );
  }

  static Future<int> addEntry(Map<String, dynamic> entry) async {
    final db = await database;
    return db.insert('diary_entries', entry);
  }

  static Future<List<Map<String, dynamic>>> fetchEntries() async {
    final db = await database;
    return db.query('diary_entries', orderBy: 'date DESC');
  }

  static Future<int> deleteEntry(int id) async {
    final db = await database;
    return db.delete('diary_entries', where: 'id = ?', whereArgs: [id]);
  }
}
