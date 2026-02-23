import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDatabase {
  static final AppDatabase instance = AppDatabase._init();
  static Database? _database;

  AppDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('inventory_app.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
      onConfigure: (db) async {
      await db.execute('PRAGMA foreign_keys = ON');
      },
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE settings(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      store_name TEXT NOT NULL,
      initial_capital REAL,
      currency TEXT,
      created_at TEXT,
      updated_at TEXT
    )
    ''');

    await db.execute('''
    CREATE TABLE products(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      cost_price REAL,
      sell_price REAL,
      quantity INTEGER NOT NULL DEFAULT 0,
      category TEXT,
      min_stock_level INTEGER,
      created_at TEXT,
      updated_at TEXT
    )
    ''');

    await db.execute('''
    CREATE TABLE sales(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 0,
    sell_price_snapshot REAL,
    cost_price_snapshot REAL,
    profit REAL,
    amount REAL,
    created_at TEXT,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
  )
    ''');

    await db.execute('''
    CREATE TABLE expenses(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      amount REAL NOT NULL DEFAULT 0,
      category TEXT,
      date TEXT,
      notes TEXT
    )
    ''');

    await db.execute('''
    CREATE TABLE inventory_adjustments(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      product_id INTEGER NOT NULL,
      system_quantity INTEGER NOT NULL DEFAULT 0,
      actual_quantity INTEGER NOT NULL DEFAULT 0,
      difference INTEGER NOT NULL DEFAULT 0,
      date TEXT,
      FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
    )
    ''');
    await db.execute(
      'CREATE INDEX idx_products_name ON products(name)');
      
    await db.execute(
      'CREATE INDEX idx_products_category ON products(category)');
      
    await db.execute(
      'CREATE INDEX idx_sales_product_id ON sales(product_id)');
      
    await db.execute(
      'CREATE INDEX idx_sales_created_at ON sales(created_at)');
      
    await db.execute(
      'CREATE INDEX idx_expenses_date ON expenses(date)');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}