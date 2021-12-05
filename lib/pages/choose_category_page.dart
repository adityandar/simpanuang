import 'package:flutter/material.dart';
import 'package:simpanuang/theme.dart';
import 'package:simpanuang/widgets/category_tile.dart';
import 'package:simpanuang/widgets/custom_back_button.dart';

class ChooseCategoryPage extends StatefulWidget {
  @override
  _ChooseCategoryPageState createState() => _ChooseCategoryPageState();
}

class _ChooseCategoryPageState extends State<ChooseCategoryPage> {
  final List kategoriMasuk = [
    'Gaji',
    'Hadiah',
    'Bonus',
    'Award',
    'penjualan',
    'Lainnya',
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
    {'id': 16, 'title': 'Lainnya'},
  ];

  int _currIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomBackButton(),
          Text(
            'Kategori',
            style: blackTextStyle.copyWith(fontSize: 19),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currIdx = 0;
                    });
                  },
                  child: Text(
                    'Masuk',
                    style: whiteTextStyle.copyWith(
                      fontSize: 17,
                      color: (_currIdx == 0) ? whiteColor : primaryColor,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    primary: (_currIdx == 0) ? primaryColor2 : inactiveColor2,
                    onPrimary: (_currIdx == 0) ? primaryColor2 : inactiveColor2,
                    elevation: 0,
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currIdx = 1;
                    });
                  },
                  child: Text(
                    'Keluar',
                    style: greenTextStyle.copyWith(
                      fontSize: 17,
                      color: (_currIdx == 0) ? primaryColor : whiteColor,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    primary: (_currIdx == 0) ? inactiveColor2 : primaryColor2,
                    onPrimary: (_currIdx == 0) ? inactiveColor2 : primaryColor2,
                    elevation: 0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32),
          (_currIdx == 0)
              ? Column(
                  children: kategoriMasuk
                      .map(
                        (item) => CategoryTile(item),
                      )
                      .toList(),
                )
              : Column(
                  children: kategoriKeluar
                      .map(
                        (item) => CategoryTile(item['title']),
                      )
                      .toList(),
                ),
        ],
      ),
    );
  }
}
