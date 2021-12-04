import 'package:flutter/material.dart';
import 'package:simpanuang/theme.dart';

class TransactionTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            children: [
              Text(
                '22',
                style: blackTextStyle.copyWith(fontSize: 31),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hari ini',
                    style: blackTextStyle.copyWith(fontSize: 13),
                  ),
                  Text(
                    'November 2021',
                    style: greyTextStyle.copyWith(fontSize: 12),
                  ),
                ],
              ),
              Spacer(),
              Text(
                '-70,000',
                style: redTextStyle.copyWith(fontSize: 16),
              ),
            ],
          ),
          Divider(
            color: primaryColor,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Makanan',
                    style: blackTextStyle.copyWith(fontSize: 16),
                  ),
                  Text(
                    'Beli kebab via grab.',
                    style: greyTextStyle.copyWith(fontSize: 11),
                  ),
                ],
              ),
              Spacer(),
              Text(
                '-70,000',
                style: redTextStyle.copyWith(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
