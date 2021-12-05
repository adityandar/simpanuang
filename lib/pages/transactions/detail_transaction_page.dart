import 'package:flutter/material.dart';
import 'package:simpanuang/pages/transactions/edit_transaction_page.dart';
import 'package:simpanuang/theme.dart';
import 'package:simpanuang/widgets/custom_back_button.dart';

class DetailTransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  'Makanan',
                  style: blackTextStyle.copyWith(
                    fontSize: 51,
                  ),
                ),
                Text(
                  'Beli kebab via grab',
                  style: greyTextStyle.copyWith(
                    fontSize: 26,
                  ),
                ),
                Text(
                  'Rp 70,000',
                  style: redTextStyle.copyWith(
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
