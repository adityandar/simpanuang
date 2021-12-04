import 'package:flutter/material.dart';
import 'package:simpanuang/pages/laporan_page.dart';
import 'package:simpanuang/pages/transaction_page.dart';
import 'package:simpanuang/theme.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget addButton() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          width: 71,
          height: 71,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add-transaction');
              },
              backgroundColor: secondaryColor2,
              child: Icon(
                Icons.add,
                color: secondaryColor,
              ),
            ),
          ),
        ),
      );
    }

    Widget customBottomNav() {
      return SizedBox(
        height: 69,
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          child: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 6,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: BottomNavigationBar(
              backgroundColor: secondaryColor,
              type: BottomNavigationBarType.fixed,
              selectedIconTheme: IconThemeData(color: activeColor),
              unselectedIconTheme: IconThemeData(color: inactiveColor),
              selectedItemColor: activeColor,
              unselectedItemColor: inactiveColor,
              iconSize: 24,
              currentIndex: currentIndex,
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.money,
                  ),
                  label: 'Transaksi',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.speaker_notes,
                  ),
                  label: 'Laporan',
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return TransactionPage();
          break;
        case 1:
          return LaporanPage();
          break;
        default:
          return TransactionPage();
      }
    }

    return Scaffold(
      bottomNavigationBar: customBottomNav(),
      floatingActionButton: addButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      body: body(),
    );
  }
}
