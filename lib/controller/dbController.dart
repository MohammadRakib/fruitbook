import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/user.dart';

class DbController{
  // DbController singleton
  static final DbController instance = DbController._();
  static Database? _database;

  DbController._(); // private constructor

  // get or initialize the database
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('fruit.db');
    return _database!;
  }

  // open the database
  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  // create the database
  Future _createDB(Database db, int version) async {
    // users database
    String id = 'id INTEGER PRIMARY KEY AUTOINCREMENT';
    String email = 'email TEXT NOT NULL';
    String password = 'password TEXT NOT NULL';
    String loginStatus = 'loginStatus BOOLEAN NOT NULL';
    String sqlUser = 'CREATE TABLE users($id, $email, $password, $loginStatus)';

    // fruits database
    String fruitName = 'fruitName TEXT NOT NULL';
    String protein = 'protein INTEGER NOT NULL';
    String carbohydrates = 'carbohydrates INTEGER NOT NULL';
    String calories = 'calories INTEGER NOT NULL';
    String fat = 'fat INTEGER NOT NULL';
    String sugar = 'sugar INTEGER NOT NULL';
    String sqlFruit = 'CREATE TABLE fruits($id, $fruitName, $carbohydrates, $protein, $calories, $fat, $sugar)';

    // executing the queries
    Batch batch = db.batch();
    batch.execute(sqlUser);
    batch.execute(sqlFruit);
    batch.commit();
  }

}