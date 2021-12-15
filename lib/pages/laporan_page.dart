import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:simpanuang/models/laporan_model.dart';
import 'package:simpanuang/services/service.dart';
import 'package:simpanuang/theme.dart';
import 'package:simpanuang/widgets/laporan_tile.dart';

class LaporanPage extends StatefulWidget {
  @override
  _LaporanPageState createState() => _LaporanPageState();
}

class _LaporanPageState extends State<LaporanPage> {
  final currencyFormatter = new intl.NumberFormat.simpleCurrency(
    locale: 'id_ID',
    decimalDigits: 0,
  );
  final DateFormat dateFormat = intl.DateFormat('dd/MM/yyyy');

  final TextEditingController _dateController = TextEditingController(
    text: DateTime.now().toString(),
  );

  final Service service = Service();

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 38),
        Text(
          'Laporan',
          style: blackTextStyle.copyWith(fontSize: 19),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 12),
        GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                child: Center(
                  child: DateTimePicker(
                    controller: _dateController,
                    dateMask: 'MMMM yyyy',
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    style: greenTextStyle.copyWith(
                      fontSize: 19,
                    ),
                    onChanged: (val) => print(val),
                    validator: (val) {
                      return null;
                    },
                    onSaved: (val) {
                      date = DateTime.tryParse(val);
                      print(date.month);
                    },
                  ),
                ),
              ),
              SizedBox(width: 16),
              Image.asset("assets/reversed_triangle.png", width: 16),
            ],
          ),
        ),
        SizedBox(height: 4),
        SizedBox(height: 8),
        Divider(color: primaryColor),
        SizedBox(height: 8),
        FutureBuilder(
            future: service.getLaporan(12, 2021),
            builder:
                (BuildContext context, AsyncSnapshot<LaporanModel> snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Pemasukan',
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              currencyFormatter
                                  .format(snapshot.data.totalPemasukan),
                              style: greenTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Pengeluaran',
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              currencyFormatter
                                  .format(snapshot.data.totalPengeluaran),
                              style: greenTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Divider(color: primaryColor),
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        children: [
                          (!(snapshot.data.total == 0 &&
                                  snapshot.data.totalPemasukan == 0 &&
                                  snapshot.data.totalPengeluaran == 0))
                              ? Row(
                                  children: [
                                    Container(
                                      height: 35,
                                      width: (MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              64) *
                                          (snapshot.data.totalPemasukan /
                                              (snapshot.data.totalPemasukan +
                                                  snapshot
                                                      .data.totalPengeluaran)),
                                      color: primaryColor,
                                      padding: EdgeInsets.only(left: 16),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '+',
                                          style: whiteTextStyle.copyWith(
                                            fontWeight: bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 35,
                                      width: (MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              64) *
                                          (snapshot.data.totalPengeluaran /
                                              (snapshot.data.totalPemasukan +
                                                  snapshot
                                                      .data.totalPengeluaran)),
                                      color: alertColor,
                                      padding: EdgeInsets.only(right: 16),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          '-',
                                          style: whiteTextStyle.copyWith(
                                            fontWeight: bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Container(
                                  height: 35,
                                  width:
                                      (MediaQuery.of(context).size.width - 64),
                                  color: inactiveColor2,
                                ),
                          SizedBox(height: 32),
                          Align(
                            alignment: Alignment.centerRight,
                            child: RichText(
                              text: TextSpan(
                                text: 'Total  ',
                                style: blackTextStyle.copyWith(fontSize: 16),
                                children: [
                                  TextSpan(
                                    text: currencyFormatter
                                        .format(snapshot.data.total),
                                    style: (snapshot.data.total.isNegative)
                                        ? redTextStyle.copyWith(fontSize: 16)
                                        : greenTextStyle.copyWith(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          ExpansionTile(
                            title: Text(
                              'Pemasukan',
                              style: greenTextStyle.copyWith(
                                fontWeight: semiBold,
                                fontSize: 21,
                              ),
                            ),
                            children: snapshot.data.resultKategoriPemasukan
                                .map(
                                  (e) => LaporanTile(
                                    harga: e['total'],
                                    jenis: 0,
                                    title: e['title'],
                                  ),
                                )
                                .toList(),
                          ),
                          ExpansionTile(
                            title: Text(
                              'Pengeluaran',
                              style: greenTextStyle.copyWith(
                                fontWeight: semiBold,
                                fontSize: 21,
                              ),
                            ),
                            children: snapshot.data.resultKategoriPengeluaran
                                .map(
                                  (e) => LaporanTile(
                                    harga: e['total'],
                                    jenis: 1,
                                    title: e['title'],
                                  ),
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
                  child: Text('Error: ' + snapshot.error.toString()),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                  ),
                );
              }
            })
      ],
    );
  }
}
