import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:simpanuang/theme.dart';

class LaporanTile extends StatelessWidget {
  final currencyFormatter = new intl.NumberFormat.simpleCurrency(
    locale: 'id_ID',
    decimalDigits: 0,
  );
  final int harga;
  final String title;
  final int jenis;

  LaporanTile({
    this.harga,
    this.title,
    this.jenis,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Color(0xFFFEFEFE),
          boxShadow: [defaultBoxShadow],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: blackTextStyle.copyWith(fontSize: 16),
            ),
            Text(
              currencyFormatter.format(harga),
              style: (jenis == 0)
                  ? greenTextStyle.copyWith(fontSize: 16)
                  : redTextStyle.copyWith(fontSize: 16),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      ),
    );
  }
}
