class LaporanModel {
  int totalPemasukan;
  int totalPengeluaran;
  int total;
  List<Map<String, dynamic>> resultKategoriPemasukan;
  List<Map<String, dynamic>> resultKategoriPengeluaran;

  LaporanModel({
    this.resultKategoriPemasukan,
    this.resultKategoriPengeluaran,
    this.total,
    this.totalPemasukan,
    this.totalPengeluaran,
  });
}
