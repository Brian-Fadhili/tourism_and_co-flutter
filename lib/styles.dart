import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {

  static const double textSizeLarge = 25.0; 
  static const double textSizeDefault = 16.0;
  static const double textSizeSmall = 12.0;
  static const double horizontalDefaultPadding = 12.0;
  static final Color textColorBright = const Color(0xFFFFFFFF);
  static final Color textColorStrong = const Color(0xFF000000);
  static final Color textColorFaint = const Color(0xFF666666);
  // static final Color textColorFaint = const Color(0xFFFBFAF3);
  static final Color accentColor = const Color(0xFFFF0000);

  static final appBarTitle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w600,
    fontSize: textSizeDefault,
    color: textColorStrong,
  );

  static final titleText = GoogleFonts.mulish(
    color: textColorBright,
  );

  static final headerText = GoogleFonts.mulish(
    fontSize: textSizeLarge,
    color: textColorStrong,
  );

  static final smallText = GoogleFonts.mulish(
    fontSize: textSizeDefault,
    color: textColorFaint,
  );

  static final locationTileTitleDark = GoogleFonts.mulish(
    fontSize: textSizeLarge,
    color: textColorBright,
  );

  static final locationTileTitleLight = GoogleFonts.mulish(
    fontSize: textSizeLarge,
    color: textColorStrong,
  );

  static final locationTileSubTitle = GoogleFonts.mulish(
    fontSize: textSizeDefault,
    color: accentColor,
  );

  static final locationTileCaption = GoogleFonts.mulish(
    fontSize: textSizeSmall,
    color: textColorFaint,
  );

  static final textCTAButton = GoogleFonts.mulish(
    fontSize: textSizeLarge,
    color: textColorBright,
  );
}