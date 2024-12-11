import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'personaldetails.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE personaldetails (
        id INTEGER PRIMARY KEY,
        name TEXT,
        email TEXT,
        phone TEXT,
        imagePath TEXT
      )
    ''');
  }

  Future<int> insertContact(Map<String, dynamic> personaldetails) async {
    final db = await database;
    return await db.insert('personaldetails', personaldetails);
  }

  Future<List<Map<String, dynamic>>> fetchContacts() async {
    final db = await database;
    return await db.query('personaldetails');
  }

  Future<int> deleteContact(int id) async {
    final db = await database;
    return await db.delete('personaldetails', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateContact(int id, Map<String, dynamic> contact) async {
    final db = await database;
    return await db
        .update('personaldetails', contact, where: 'id = ?', whereArgs: [id]);
  }
}
