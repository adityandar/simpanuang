import 'package:intl/intl.dart';

class TransactionModel {
  int id;
  int jenis; //0: pemasukan, 1: pengeluaran
  int kategori;
  int harga;
  String tanggal;
  String catatan;

  TransactionModel({
    this.catatan,
    this.id,
    this.jenis,
    this.kategori,
    this.tanggal,
    this.harga,
  });

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jenis = json['jenis'];
    kategori = json['kategori'];
    tanggal = json["tanggal"];
    catatan = json["catatan"];
    harga = json["harga"];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jenis': jenis,
      'kategori': kategori,
      'tanggal': tanggal,
      'catatan': catatan,
      'harga': harga,
    };
  }
}
