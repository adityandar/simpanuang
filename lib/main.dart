import 'package:flutter/material.dart';
import 'package:simpanuang/pages/choose_category_page.dart';
import 'package:simpanuang/pages/main_page.dart';
import 'package:simpanuang/pages/transactions/add_transaction_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => MainPage(),
        '/add-transaction': (context) => AddTransactionPage(),
        '/choose-category': (context) => ChooseCategoryPage(),
      },
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child,
        );
      },
    );
  }
}
