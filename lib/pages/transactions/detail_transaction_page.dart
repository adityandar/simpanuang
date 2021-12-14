import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simpanuang/models/transaction_model.dart';
import 'package:simpanuang/pages/transactions/edit_transaction_page.dart';
import 'package:simpanuang/theme.dart';
import 'package:simpanuang/widgets/custom_back_button.dart';

class DetailTransactionPage extends StatelessWidget {
  final TransactionModel transaction;

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
                          builder: (context) => EditTransactionPage(),
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
                Text(
                  transaction.catatan,
                  style: greyTextStyle.copyWith(
                    fontSize: 26,
                  ),
                ),
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
                Text(
                  '22 November 2021',
                  style: blackTextStyle.copyWith(
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 86),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
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
