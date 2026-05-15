import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {

  static const double headerTextSize = 25.0;
  static const double defaultTextSize = 16.0;
  static final Color titleTextColor = const Color(0xFFFFFFFF);
  static final Color headerTextColor =  const Color(0xFF000000);
  static final Color defaultTextColor = const Color(0xFF666666);

  static final titleText = TextStyle(
    fontFamily: GoogleFonts.mulish().fontFamily,
    color: titleTextColor,
  );

  static final headerText = TextStyle(
    fontFamily: GoogleFonts.mulish().fontFamily,
    fontSize: headerTextSize,
    color: headerTextColor,
  );

  static final smallText = TextStyle(
    fontFamily: GoogleFonts.mulish().fontFamily,
    fontSize: defaultTextSize,
    color: defaultTextColor,
  );
}