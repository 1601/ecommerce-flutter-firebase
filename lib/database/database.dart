import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabase {
  static final CartDatabase _instance = CartDatabase._();
  static Database _database;

  CartDatabase._();

  factory CartDatabase() {
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
    String dbPath = join(directory.path, 'database1.db');
    var database = openDatabase(dbPath,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);

    return database;
  }

  void _onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE cart(
        itemId INTEGER)
    ''');
    print("Database was created!");
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    // Run migration according database versions
  }

  Future<int> addToCart(int itemId) async {
    var client = await db;
    return client.rawInsert('INSERT INTO cart(itemID) VALUES ($itemId)');
  }

  Future<List<int>> fetchAll() async {
    var client = await db;
    var res = await client.query('cart');
    List<int> itemIds = [];
    if (res.isNotEmpty) {
      res.forEach((element) {
        itemIds.add(element['itemId']);
      });
      return itemIds;
    }
    return itemIds;
  }

  Future<void> removeFromCart(int itemId) async {
    var client = await db;
    return client.delete('cart', where: 'itemId = ?', whereArgs: [itemId]);
  }

  Future<void> emptyCart() async {
    var client = await db;
    return client.delete('cart');
  }

  Future closeDb() async {
    var client = await db;
    client.close();
  }
}
