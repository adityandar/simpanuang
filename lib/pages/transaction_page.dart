import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simpanuang/models/transaction_model.dart';
import 'package:simpanuang/services/service.dart';
import 'package:simpanuang/theme.dart';
import 'package:simpanuang/widgets/transaction_tile.dart';

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final Service service = Service();

  final currencyFormatter = new NumberFormat.simpleCurrency(
    locale: 'id_ID',
    decimalDigits: 0,
  );
  int bulan = DateTime.now().month;

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
              FutureBuilder(
                future: service.getTotalHargaTransaksi(),
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.isNegative) {
                      return Text(
                        currencyFormatter.format(snapshot.data),
                        style: redTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 34,
                        ),
                      );
                    } else {
                      return Text(
                        currencyFormatter.format(snapshot.data),
                        style: greenTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 34,
                        ),
                      );
                    }
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                      ),
                    );
                  }
                },
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
              GestureDetector(
                onTap: () {
                  setState(() {
                    bulan = DateTime.now().month - 1;
                    if (DateTime.now().month == 1) {
                      bulan = 12;
                    }
                  });
                },
                child: Container(
                  width: 128,
                  height: 26,
                  decoration: BoxDecoration(
                    color: (bulan == DateTime.now().month - 1 ||
                            (bulan == 12 && DateTime.now().month == 1))
                        ? secondaryColor
                        : inactiveColor2,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Bulan Kemarin',
                      style: greenTextStyle.copyWith(fontSize: 12),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  setState(() {
                    bulan = DateTime.now().month;
                  });
                },
                child: Container(
                  width: 128,
                  height: 26,
                  decoration: BoxDecoration(
                    color: (bulan == DateTime.now().month)
                        ? secondaryColor
                        : inactiveColor2,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Bulan ini',
                      style: greenTextStyle.copyWith(fontSize: 12),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  setState(() {
                    bulan = DateTime.now().month + 1;
                    if (DateTime.now().month == 12) {
                      bulan = 1;
                    }
                  });
                },
                child: Container(
                  width: 128,
                  height: 26,
                  decoration: BoxDecoration(
                    color: (bulan == DateTime.now().month + 1 ||
                            (bulan == 1 && DateTime.now().month == 12))
                        ? secondaryColor
                        : inactiveColor2,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Bulan depan',
                      style: greenTextStyle.copyWith(fontSize: 12),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 41),
            ],
          ),
        ),
        SizedBox(height: 24),
        FutureBuilder(
          future: service.getTransactions(bulan),
          builder: (BuildContext context,
              AsyncSnapshot<List<TransactionModel>> snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              if (snapshot.data.isEmpty) {
                return Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                    child: Text(
                      "Anda belum melakukan transaksi.",
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              }
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 41),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FutureBuilder(
                          future: service.getSummaryHarga(bulan),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<int>> snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Pemasukan',
                                        style: blackTextStyle.copyWith(
                                            fontSize: 16),
                                      ),
                                      Text(
                                        currencyFormatter
                                            .format(snapshot.data[0]),
                                        style: greenTextStyle.copyWith(
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Pengeluaran',
                                        style: blackTextStyle.copyWith(
                                            fontSize: 16),
                                      ),
                                      Text(
                                        currencyFormatter
                                            .format(snapshot.data[1]),
                                        style:
                                            redTextStyle.copyWith(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Divider(
                                    color: primaryColor,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    currencyFormatter.format(snapshot.data[2]),
                                    style: (snapshot.data[2].isNegative)
                                        ? redTextStyle.copyWith(
                                            fontWeight: semiBold,
                                            fontSize: 16,
                                          )
                                        : greenTextStyle.copyWith(
                                            fontWeight: semiBold,
                                            fontSize: 16,
                                          ),
                                    // textAlign: TextAlign.right,
                                  ),
                                ],
                              );
                            } else if (snapshot.hasError) {
                              return Text(snapshot.error.toString());
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      primaryColor),
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(height: 42),
                        Column(
                          children: snapshot.data
                              .map(
                                (transaksi) => TransactionTile(transaksi),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ' + snapshot.error),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
