import 'package:flutter/material.dart';
import 'package:simpanuang/theme.dart';
import 'package:simpanuang/widgets/custom_back_button.dart';

class AddTransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomBackButton(),
          Text(
            'Transaksi',
            style: blackTextStyle.copyWith(fontSize: 19),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      child: Center(
                        child: Text(
                          'IDR',
                          style: greenTextStyle.copyWith(
                            fontWeight: bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: whiteColor,
                          boxShadow: [defaultBoxShadow],
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration.collapsed(
                            hintText: '0',
                            fillColor: primaryColor,
                          ),
                          style: greenTextStyle.copyWith(
                            fontWeight: bold,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      child: Icon(
                        Icons.category_outlined,
                        color: primaryColor,
                        size: 35,
                      ),
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/choose-category');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: whiteColor,
                            boxShadow: [defaultBoxShadow],
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            'Pilih Kategori',
                            style: greenTextStyle.copyWith(
                              fontSize: 19,
                              color: Color(0x9957C478),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      child: Icon(
                        Icons.calendar_today_outlined,
                        color: primaryColor,
                        size: 35,
                      ),
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: whiteColor,
                          boxShadow: [defaultBoxShadow],
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text(
                          'Hari Ini',
                          style: greenTextStyle.copyWith(
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      child: Icon(
                        Icons.notes,
                        color: primaryColor,
                        size: 35,
                      ),
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: whiteColor,
                          boxShadow: [defaultBoxShadow],
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: TextFormField(
                          decoration: InputDecoration.collapsed(
                            hintText: 'Tulis Catatan',
                            fillColor: primaryColor,
                            hintStyle: greenTextStyle.copyWith(
                              fontSize: 19,
                              color: Color(0x9957C478),
                            ),
                          ),
                          style: greenTextStyle.copyWith(
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 120),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Simpan',
                style: whiteTextStyle.copyWith(fontSize: 19),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                primary: primaryColor2,
                onPrimary: primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
