import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {

  static const double headerTextSize = 25.0; //textsizelarge
  static const double defaultTextSize = 16.0;//textsizedefault
  static const double textSizeSmall = 12.0;
  static const double horizontalDefaultPadding = 12.0;
  static final Color titleTextColor = const Color(0xFFFFFFFF);//textcoorbright
  static final Color headerTextColor = const Color(0xFF000000);//textcolordefault/strong
  static final Color defaultTextColor = const Color(0xFF666666);//textcolorfaint
  static final Color textColorFaint = const Color(0xFFFBFAF3);//textcolorfaint
  static final Color accentColor = const Color(0xFFFF0000);

  static final appBarTitle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w600,
    fontSize: defaultTextSize,
    color: headerTextColor,
  );

  static final titleText = GoogleFonts.mulish(
    color: titleTextColor,
  );

  static final headerText = GoogleFonts.mulish(
    fontSize: headerTextSize,
    color: headerTextColor,
  );

  static final smallText = GoogleFonts.mulish(
    fontSize: defaultTextSize,
    color: defaultTextColor,
  );

  static final locationTileTitleDark = GoogleFonts.mulish(
    fontSize: headerTextSize,
    color: titleTextColor,
  );

  static final locationTileTitleLight = GoogleFonts.mulish(
    fontSize: headerTextSize,
    color: headerTextColor,
  );

  static final locationTileSubTitle = GoogleFonts.mulish(
    fontSize: defaultTextSize,
    color: accentColor,
  );

  static final locationTileCaption = GoogleFonts.mulish(
    fontSize: textSizeSmall,
    color: defaultTextColor,
  );

  static final textCTAButton = GoogleFonts.mulish(
    fontSize: headerTextSize,
    color: titleTextColor,
  );
}