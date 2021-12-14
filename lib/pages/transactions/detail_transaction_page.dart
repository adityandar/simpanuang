import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simpanuang/models/transaction_model.dart';
import 'package:simpanuang/pages/transactions/edit_transaction_page.dart';
import 'package:simpanuang/services/service.dart';
import 'package:simpanuang/theme.dart';
import 'package:simpanuang/widgets/custom_back_button.dart';

class DetailTransactionPage extends StatelessWidget {
  final TransactionModel transaction;

  final Service service = Service();

  final currencyFormatter = new NumberFormat.simpleCurrency(
    locale: 'id_ID',
    decimalDigits: 0,
  );

  final List kategoriMasuk = [
    {'id': 0, 'title': 'Gaji'},
    {'id': 1, 'title': 'Hadiah'},
    {'id': 2, 'title': 'Bonus'},
    {'id': 3, 'title': 'Award'},
    {'id': 4, 'title': 'Penjualan'},
    {'id': 5, 'title': 'Lainnya'}
  ];

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

  DetailTransactionPage(this.transaction);
  @override
  Widget build(BuildContext context) {
    String kategori = "";
    if (transaction.jenis == 0) {
      kategori = kategoriMasuk[transaction.kategori]['title'];
    } else {
      kategori = kategoriKeluar[transaction.kategori]['title'];
    }
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomBackButton(),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 24, top: 32),
                  child: TextButton(
                    child: Text(
                      'Edit',
                      style: blackTextStyle.copyWith(
                        fontSize: 22,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EditTransactionPage(transaction),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 45),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  kategori,
                  style: blackTextStyle.copyWith(
                    fontSize: 51,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  transaction.catatan,
                  style: greyTextStyle.copyWith(
                    fontSize: 20,
                    height: 1,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Text(
                  currencyFormatter.format(transaction.harga),
                  style: (transaction.jenis == 0)
                      ? greenTextStyle.copyWith(
                          fontSize: 34,
                          fontWeight: semiBold,
                        )
                      : redTextStyle.copyWith(
                          fontSize: 34,
                          fontWeight: semiBold,
                        ),
                ),
                SizedBox(height: 8),
                Text(
                  DateFormat("dd MMMM yyyy", 'id_ID').format(
                    DateTime.tryParse(transaction.tanggal),
                  ),
                  style: blackTextStyle.copyWith(
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 86),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      //TODO: Buat confirmation dulu apakah mau delete/ga.
                      try {
                        int result =
                            await service.deleteTransaction(transaction.id);
                        if (result == 1) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Berhasil terhapus!'),
                              backgroundColor: primaryColor,
                              duration: Duration(milliseconds: 500),
                            ),
                          );
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/', (route) => false);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Error, gagal terhapus!'),
                              backgroundColor: alertColor,
                              duration: Duration(milliseconds: 300),
                            ),
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(e.toString()),
                            backgroundColor: alertColor,
                            duration: Duration(milliseconds: 300),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Hapus',
                      style: whiteTextStyle.copyWith(fontSize: 19),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      primary: alertColor,
                      onPrimary: alertColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
