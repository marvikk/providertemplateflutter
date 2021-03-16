import 'dart:developer';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:providertemplate/business_logic/models/chicken.dart';
import 'package:providertemplate/services/web_api/web_api.dart';
import 'package:sqflite/sqflite.dart';

class WebApiSql implements WebApi {
  static final WebApiSql _instance = WebApiSql._();
  static Database _database;

  WebApiSql._();

  factory WebApiSql() {
    return _instance;
  }
  Future<Database> get db async {
    if (_database != null) {
      return _database;
    }
    _database = await init();

    return _database;
  }

  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    log('db path: ' + directory.path);
    String dbPath = join(directory.path, 'database1.db');
    var database = await openDatabase(dbPath,
        version: 2, onCreate: _onCreate, onUpgrade: _onUpgrade);

    return database;
  }

  // UPGRADE DATABASE TABLES
  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    if (oldVersion < newVersion) {
      db.execute("ALTER TABLE chicken ADD COLUMN description TEXT;");
    }
  }

  void _onCreate(Database db, int version) {
    db.execute('''
    CREATE TABLE chicken(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      age INTEGER,
      description TEXT)
  ''');
    print("Database was created!");
  }

  @override
  Future<List<Chicken>> fetchChickens() async {
    var client = await db;
    // client.insert(
    //     'chicken',
    //     Chicken(
    //             age: 1,
    //             name: "Test db change",
    //             description: "her we describe our chicken")
    //         .toMap(),
    //     conflictAlgorithm: ConflictAlgorithm.replace);
    // client.insert('chicken', Chicken(age: 2, name: "Billy").toMap(),
    //     conflictAlgorithm: ConflictAlgorithm.replace);
    // client.insert('chicken', Chicken(age: 1, name: "Kate").toMap(),
    //     conflictAlgorithm: ConflictAlgorithm.replace);

    final List<Map<String, dynamic>> maps = await client.query('chicken');

    return List.generate(maps.length, (i) {
      return Chicken(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
        description: maps[i]['description'],
      );
    });
  }
}
