import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simpanuang/models/transaction_model.dart';
import 'package:simpanuang/pages/transactions/detail_transaction_page.dart';
import 'package:simpanuang/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TransactionTile extends StatelessWidget {
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

  final List months = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];

  TransactionTile(this.transaction);
  @override
  Widget build(BuildContext context) {
    String kategori = "";
    DateTime date = DateTime.tryParse(transaction.tanggal);
    if (transaction.jenis == 0) {
      kategori = kategoriMasuk[transaction.kategori]['title'];
    } else {
      kategori = kategoriKeluar[transaction.kategori]['title'];
    }
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailTransactionPage(transaction),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [defaultBoxShadow],
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      date.day.toString(),
                      style: blackTextStyle.copyWith(fontSize: 31),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          (date.day == DateTime.now().day)
                              ? 'Hari ini'
                              : DateFormat('EEEE', 'id_ID').format(date),
                          style: blackTextStyle.copyWith(fontSize: 13),
                        ),
                        Text(
                          '${months[date.month - 1]} ${date.year}',
                          style: greyTextStyle.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                (transaction.jenis == 0)
                    ? AutoSizeText(
                        currencyFormatter.format(transaction.harga),
                        style: greenTextStyle,
                        maxFontSize: 16,
                      )
                    : AutoSizeText(
                        '-${currencyFormatter.format(transaction.harga)}',
                        style: redTextStyle,
                        maxFontSize: 16,
                      ),
              ],
            ),
            Divider(
              color: primaryColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      kategori,
                      style: blackTextStyle.copyWith(fontSize: 16),
                    ),
                    Container(
                      width: 200,
                      child: Text(
                        transaction.catatan,
                        style: greyTextStyle.copyWith(fontSize: 11),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                (transaction.jenis == 0)
                    ? AutoSizeText(
                        currencyFormatter.format(transaction.harga),
                        style: greenTextStyle,
                        maxFontSize: 16,
                      )
                    : AutoSizeText(
                        '-${currencyFormatter.format(transaction.harga)}',
                        style: redTextStyle,
                        maxFontSize: 16,
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
