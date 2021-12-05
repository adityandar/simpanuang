import 'package:flutter/material.dart';
import 'package:simpanuang/theme.dart';
import 'package:simpanuang/widgets/transaction_tile.dart';

class TransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 38),
        Text(
          'Transaksi',
          style: blackTextStyle.copyWith(fontSize: 19),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 41,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              Text(
                'Rp 3,034,500',
                style: greenTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 34,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 30,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: 41),
              Container(
                width: 128,
                height: 26,
                decoration: BoxDecoration(
                  color: inactiveColor2,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Bulan Kemarin',
                    style: greenTextStyle.copyWith(fontSize: 12),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Container(
                width: 128,
                height: 26,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Bulan ini',
                    style: greenTextStyle.copyWith(fontSize: 12),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Container(
                width: 128,
                height: 26,
                decoration: BoxDecoration(
                  color: inactiveColor2,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Bulan depan',
                    style: greenTextStyle.copyWith(fontSize: 12),
                  ),
                ),
              ),
              SizedBox(width: 41),
            ],
          ),
        ),
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 41),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pemasukan',
                    style: blackTextStyle.copyWith(fontSize: 16),
                  ),
                  Text(
                    '2,540,500',
                    style: greenTextStyle.copyWith(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pengeluaran',
                    style: blackTextStyle.copyWith(fontSize: 16),
                  ),
                  Text(
                    '570,000',
                    style: redTextStyle.copyWith(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Divider(
                color: primaryColor,
              ),
              SizedBox(height: 8),
              Text(
                '1.970.500',
                style: greenTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 16,
                ),
                // textAlign: TextAlign.right,
              ),
              SizedBox(height: 42),
              Column(
                children: [
                  TransactionTile(),
                  TransactionTile(),
                  TransactionTile(),
                  TransactionTile(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
