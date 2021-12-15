import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
    );

    var assetsImage = AssetImage(
        'assets/logo.png'); //<- Creates an object that fetches an image.
    var image = Image(
        image: assetsImage,
        height: 300); //<- Creates a widget that displays an image.

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: image,
        ),
      ),
    );
  }
}
