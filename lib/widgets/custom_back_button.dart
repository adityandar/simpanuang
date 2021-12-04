import 'package:flutter/material.dart';
import 'package:simpanuang/theme.dart';

class CustomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, top: 32),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
