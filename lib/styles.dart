import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {

  static const double headerTextSize = 25.0; //_textsizelarge
  static const double defaultTextSize = 16.0; //textsizedefault
  static const double textSizeSmall = 12.0;
  static final Color titleTextColor = const Color(0xFFFFFFFF); //textcolorbright
  static final Color headerTextColor =  const Color(0xFF000000); //textcolordefault/strong
  static final Color defaultTextColor = const Color(0xFF666666); //textcolorfaint
  static final Color textColorFaint = const Color(0xFFFBFAF3); //textcolorfaint
  static final Color accentColor = const Color(0xFFFF0000); 

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

  static final locationTileTitleDark = TextStyle(
    fontFamily: GoogleFonts.mulish().fontFamily,
    fontSize: headerTextSize,
    color: titleTextColor,
  ); 

  static final locationTileTitleLight = TextStyle(
    fontFamily: GoogleFonts.mulish().fontFamily,
    fontSize: headerTextSize,
    color: headerTextColor,
  );

  static final locationTileSubTitle = TextStyle(
    fontFamily: GoogleFonts.mulish().fontFamily,
    fontSize: defaultTextSize,
    color: accentColor,
  );

  static final locationTileCaption = TextStyle(
    fontFamily: GoogleFonts.mulish().fontFamily,
    fontSize: textSizeSmall,
    color: defaultTextColor,
  );
}