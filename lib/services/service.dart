import 'package:simpanuang/models/laporan_model.dart';
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
    String bln;
    if (bulan.bitLength == 1) {
      bln = "0" + bulan.toString();
    } else {
      bln = bulan.toString();
    }
    final db = await init();
    final maps = await db.query("Transactions",
        where: "strftime('%m', tanggal) = ?", whereArgs: [bln]);

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
    String bln;
    if (bulan.bitLength == 1) {
      bln = "0" + bulan.toString();
    } else {
      bln = bulan.toString();
    }
    final db = await init();
    final resultDapat = await db.rawQuery(
      "SELECT SUM(harga) FROM Transactions WHERE strftime('%m', tanggal) = ? AND jenis = 0",
      [
        bln,
      ],
    );

    final resultKeluar = await db.rawQuery(
      "SELECT SUM(harga) FROM Transactions WHERE strftime('%m', tanggal) = ? AND jenis = 1",
      [
        bln,
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

  Future<LaporanModel> getLaporan(DateTime date) async {
    int bulan = date.month;
    int tahun = date.year;
    //returns the transactions as a list (array)
    final List kategoriMasuk = [
      {'id': 0, 'title': 'Gaji'},
      {'id': 1, 'title': 'Hadiah'},
      {'id': 2, 'title': 'Bonus'},
      {'id': 3, 'title': 'Award'},
      {'id': 4, 'title': 'Penjualan'},
      {'id': 5, 'title': 'Lainnya'}
    ];
    List<Map<String, dynamic>> resultKategoriMasuk = [];
    final List kategoriKeluar = [
      {'id': 0, 'title': 'Donasi & Amal'},
      {'id': 1, 'title': 'Belanja'},
      {'id': 2, 'title': 'Tagihan'},
      {'id': 3, 'title': 'Cicilan'},
      {'id': 4, 'title': 'Makanan'},
      {'id': 5, 'title': 'Kesehatan'},
      {'id': 6, 'title': 'Edukasi'},
      {'id': 7, 'title': 'Buku'},
      {'id': 8, 'title': 'Bisnis'},
      {'id': 9, 'title': 'Transportasi'},
      {'id': 10, 'title': 'Teman & Pasangan'},
      {'id': 11, 'title': 'Hiburan'},
      {'id': 12, 'title': 'Keluarga'},
      {'id': 13, 'title': 'Investasi'},
      {'id': 14, 'title': 'Asuransi'},
      {'id': 15, 'title': 'Lainnya'},
    ];
    List<Map<String, dynamic>> resultKategoriKeluar = [];
    String bln;
    if (bulan.bitLength == 1) {
      bln = "0" + bulan.toString();
    } else {
      bln = bulan.toString();
    }
    final db = await init();
    final resultDapat = await db.rawQuery(
      "SELECT SUM(harga) FROM Transactions WHERE strftime('%m', tanggal) = ? AND strftime('%Y', tanggal) = ?  AND jenis = 0",
      [
        bln,
        tahun.toString(),
      ],
    );

    kategoriMasuk.forEach(
      (element) async {
        var result = await db.rawQuery(
          "SELECT SUM(harga) FROM Transactions WHERE strftime('%m', tanggal) = ? AND strftime('%Y', tanggal) = ?  AND jenis = 0 AND kategori = ?",
          [
            bln,
            tahun.toString(),
            element["id"],
          ],
        );
        resultKategoriMasuk.add(
          {
            'title': element["title"],
            'total':
                (result[0]["SUM(harga)"] == null) ? 0 : result[0]["SUM(harga)"]
          },
        );
      },
    );

    kategoriKeluar.forEach(
      (element) async {
        var result = await db.rawQuery(
          "SELECT SUM(harga) FROM Transactions WHERE strftime('%m', tanggal) = ? AND strftime('%Y', tanggal) = ?  AND jenis = 1 AND kategori = ?",
          [
            bln,
            tahun.toString(),
            element["id"],
          ],
        );
        resultKategoriKeluar.add(
          {
            'title': element["title"],
            'total':
                (result[0]["SUM(harga)"] == null) ? 0 : result[0]["SUM(harga)"]
          },
        );
      },
    );

    final resultKeluar = await db.rawQuery(
      "SELECT SUM(harga) FROM Transactions WHERE strftime('%m', tanggal) = ? AND strftime('%Y', tanggal) = ?  AND jenis = 1",
      [
        bln,
        tahun.toString(),
      ],
    );

    int resultDapatFix = (resultDapat[0]["SUM(harga)"] == null)
        ? 0
        : resultDapat[0]["SUM(harga)"];
    int resultKeluarFix = (resultKeluar[0]["SUM(harga)"] == null)
        ? 0
        : resultKeluar[0]["SUM(harga)"];
    int resultTotal = resultDapatFix - resultKeluarFix;

    LaporanModel laporan = LaporanModel(
      totalPemasukan: resultDapatFix,
      totalPengeluaran: resultKeluarFix,
      total: resultTotal,
      resultKategoriPemasukan: resultKategoriMasuk,
      resultKategoriPengeluaran: resultKategoriKeluar,
    );

    return laporan;
  }
}
