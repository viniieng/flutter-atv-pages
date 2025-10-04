import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'task_model.dart';

class TaskDb {
  static const _dbName = 'tasks.db';
  static const _table = 'tasks';
  Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    final path = join(await getDatabasesPath(), _dbName);
    _db = await openDatabase(path, version: 1, onCreate: (db, v) async {
      await db.execute('''
        CREATE TABLE $_table(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          done INTEGER NOT NULL
        )
      ''');
    });
    return _db!;
  }

  Future<int> insert(Task t) async => (await db).insert(_table, t.toMap());
  Future<List<Task>> all() async {
    final rows = await (await db).query(_table, orderBy: 'id DESC');
    return rows.map(Task.fromMap).toList();
  }
  Future<int> update(Task t) async => (await db).update(_table, t.toMap(), where: 'id=?', whereArgs: [t.id]);
  Future<int> delete(int id) async => (await db).delete(_table, where: 'id=?', whereArgs: [id]);
}
