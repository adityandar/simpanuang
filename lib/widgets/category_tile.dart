import 'package:flutter/material.dart';
import 'package:simpanuang/theme.dart';

class CategoryTile extends StatelessWidget {
  final String title;
  CategoryTile(this.title);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 50),
          child: Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 23,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Divider(color: primaryColor),
        SizedBox(height: 8),
      ],
    );
  }
}
