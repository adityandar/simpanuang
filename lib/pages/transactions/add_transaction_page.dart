import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simpanuang/pages/choose_category_page.dart';
import 'package:simpanuang/theme.dart';
import 'package:simpanuang/widgets/custom_back_button.dart';

class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  int currCategoryId = -1;
  String currCategoryTitle = "";
  int currCategoryType = 0;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _dateController = TextEditingController(
    text: DateTime.now().toString(),
  );
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void handleSimpan() {
      if (_formKey.currentState.validate()) {
        if (currCategoryId == -1) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Kategori tidak boleh kosong.'),
              backgroundColor: alertColor,
              duration: Duration(milliseconds: 300),
            ),
          );
        } else {
          //INI APABILA BERHASIL.
          print(
              "${_dateController.text} ${_noteController.text} ${_priceController.text} ${currCategoryTitle}");
        }
      } else {}
    }

    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
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
                            controller: _priceController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: InputDecoration.collapsed(
                              hintText: '0',
                              fillColor: primaryColor,
                            ),
                            style: greenTextStyle.copyWith(
                              fontWeight: bold,
                              fontSize: 19,
                            ),
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value == "0" ||
                                  value == "") {
                                return 'Jumlah transaksi tidak boleh kosong.';
                              }
                              return null;
                            },
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
                          onTap: () async {
                            List result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ChooseCategoryPage()));
                            print(result);
                            setState(() {
                              currCategoryId = result[0]['id'];
                              currCategoryTitle = result[0]['title'];
                              currCategoryType = result[1];
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: whiteColor,
                              boxShadow: [defaultBoxShadow],
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text(
                              (currCategoryId == -1)
                                  ? 'Pilih Kategori'
                                  : currCategoryTitle,
                              style: greenTextStyle.copyWith(
                                fontSize: 19,
                                color: (currCategoryId != -1)
                                    ? primaryColor
                                    : Color(0x9957C478),
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
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: DateTimePicker(
                            controller: _dateController,
                            dateMask: 'd MMMM yyyy',
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
                              print(val);
                              return null;
                            },
                            onSaved: (val) => print(val),
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
                            controller: _noteController,
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
                onPressed: handleSimpan,
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
      ),
    );
  }
}
