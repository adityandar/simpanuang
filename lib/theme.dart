import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

Color backgroundColor = Color(0xFFFFFFFF);
Color primaryColor = Color(0xFF1B8366);
Color primaryColor2 = Color(0xFF57C478);
Color secondaryColor = Color(0xFFFFDD0E);
Color secondaryColor2 = Color(0xFFE9AE0B);
Color accentColor = Color(0xFF0BAEE2);
Color alertColor = Color(0xFFE90B0B);
Color inactiveColor = Color(0xFFB49D0A);
Color inactiveColor2 = Color(0xFFF3F3F3);
Color inactiveColor3 = Color(0xFF9C9C9C);
Color activeColor = Colors.black;
Color whiteColor = Colors.white;

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: Colors.black,
);

TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: Colors.white,
);

TextStyle greenTextStyle = GoogleFonts.poppins(
  color: primaryColor,
);

TextStyle blueTextStyle = GoogleFonts.poppins(
  color: accentColor,
);

TextStyle redTextStyle = GoogleFonts.poppins(
  color: alertColor,
);

TextStyle greyTextStyle = GoogleFonts.poppins(
  color: inactiveColor3,
);

BoxShadow defaultBoxShadow = BoxShadow(
  color: Color(0x331B8366),
  offset: Offset(4, 4),
  blurRadius: 10,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
