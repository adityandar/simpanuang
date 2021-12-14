import 'package:sqflite/sqflite.dart'; //sqflite package
import 'package:path_provider/path_provider.dart'; //path_provider package
import 'package:path/path.dart'; //used to join paths
import 'package:simpanuang/models/transaction_model.dart'; //import model class
import 'dart:io';
import 'dart:async';

class Service {
  Future<Database> init() async {
    Directory directory =
        await getApplicationDocumentsDirectory(); //returns a directory which stores permanent files
    final path =
        join(directory.path, "simpanuang.db"); //create path to database

    return await openDatabase(
        //open the database or create a database if there isn't any
        path,
        version: 1, onCreate: (Database db, int version) async {
      await db.execute("""
          CREATE TABLE Transactions(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          jenis INTEGER,
          kategori INTEGER,
          tanggal TEXT,
          catatan TEXT,
          harga INT
          )""");
    });
  }

  Future<int> addTransaction(TransactionModel transaction) async {
    //returns number of items inserted as an integer

    final db = await init(); //open database

    return db.insert("Transactions", transaction.toJson());
  }

  Future<List<TransactionModel>> getTransactions(int bulan) async {
    //returns the transactions as a list (array)

    final db = await init();
    final maps = await db.query("Transactions",
        where: "strftime('%m', tanggal) = '?'", whereArgs: [bulan]);

    return List.generate(maps.length, (i) {
      //create a list of transactions
      return TransactionModel(
        id: maps[i]['id'],
        jenis: maps[i]['jenis'],
        kategori: maps[i]['kategori'],
        tanggal: maps[i]['tanggal'],
        catatan: maps[i]['catatan'],
        harga: maps[i]['harga'],
      );
    });
  }

  Future<int> getTotalHargaTransaksi() async {
    final db = await init();
    final resultDapat = await db.rawQuery(
      "SELECT SUM(harga) FROM Transactions WHERE jenis = 0",
    );

    final resultKeluar = await db.rawQuery(
      "SELECT SUM(harga) FROM Transactions WHERE jenis = 1",
    );

    int resultDapatFix = (resultDapat[0]["SUM(harga)"] == null)
        ? 0
        : resultDapat[0]["SUM(harga)"];
    int resultKeluarFix = (resultKeluar[0]["SUM(harga)"] == null)
        ? 0
        : resultKeluar[0]["SUM(harga)"];
    int resultTotal = resultDapatFix - resultKeluarFix;
    return resultTotal;
  }

  Future<List<int>> getSummaryHarga(int bulan) async {
    //returns the transactions as a list (array)

    final db = await init();
    final resultDapat = await db.rawQuery(
      "SELECT SUM(harga) FROM Transactions WHERE strftime('%m', tanggal) = '?' AND jenis = 0",
      [
        bulan,
      ],
    );

    final resultKeluar = await db.rawQuery(
      "SELECT SUM(harga) FROM Transactions WHERE strftime('%m', tanggal) = '?' AND jenis = 1",
      [
        bulan,
      ],
    );

    int resultDapatFix = (resultDapat[0]["SUM(harga)"] == null)
        ? 0
        : resultDapat[0]["SUM(harga)"];
    int resultKeluarFix = (resultKeluar[0]["SUM(harga)"] == null)
        ? 0
        : resultKeluar[0]["SUM(harga)"];
    int resultTotal = resultDapatFix - resultKeluarFix;
    return [
      resultDapatFix,
      resultKeluarFix,
      resultTotal,
    ];
  }

  Future<int> deleteTransaction(int id) async {
    //returns number of items deleted
    final db = await init();

    int result = await db.delete("Transactions", //table name
        where: "id = ?",
        whereArgs: [id] // use whereArgs to avoid SQL injection
        );

    return result;
  }

  Future<int> updateTransaction(int id, TransactionModel transaction) async {
    // returns the number of rows updated

    final db = await init();
    print(id);

    int result = await db.update("Transactions", transaction.toJson(),
        where: "id = ?", whereArgs: [id]);
    return result;
  }
}
