class TransactionModel {
  int id;
  int jenis; //0: pemasukan, 1: pengeluaran
  int kategori;
  String tanggal;
  String catatan;

  TransactionModel({
    this.catatan,
    this.id,
    this.jenis,
    this.kategori,
    this.tanggal,
  });

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jenis = json['jenis'];
    kategori = json['kategori'];
    tanggal = json["tanggal"];
    catatan = json["catatan"];
  }

  Map<String, dynamic> toJson() {
    return {
      'jenis': jenis,
      'kategori': kategori,
      'tanggal': tanggal,
      'catatan': catatan,
    };
  }
}
