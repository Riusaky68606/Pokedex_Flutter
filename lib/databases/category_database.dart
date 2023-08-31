import 'package:path/path.dart';
import 'package:pokedex_mobile/dtos/category_model.dart';
import 'package:sqflite/sqflite.dart';

class CategoryDatabase {
  static final CategoryDatabase instance = CategoryDatabase._init();

  static Database? _database;

  CategoryDatabase._init();
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB('pokedex.db');
    return _database!;
  }

  Future<Database> _initDB(String file) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, file);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableCategory(
        ${CategoryField.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${CategoryField.name} TEXT NO NULL,
        ${CategoryField.image} TEXT NO NULL
        )
      ''');
  }

  Future<void> create(CategoryModel category) async {
    final db = await instance.database;

    await db.insert(tableCategory, category.toJson());
  }

  Future<List<CategoryModel>> readAllCategories() async {
    final db = await instance.database;
    final results = await db.query(tableCategory);

    return results
        .map((mapCategories) => CategoryModel.fromJson(mapCategories))
        .toList();
  }

  Future<void> delete(int id) async {
    final db = await instance.database;
    await db.delete(tableCategory,
        where: '${CategoryField.id} = ?', whereArgs: [id]);
  }

  Future<void> close() async {
    final db = await instance.database;
    db.close();
  }
}
