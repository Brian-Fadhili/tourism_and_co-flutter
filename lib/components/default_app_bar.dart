import 'package:flutter/material.dart';
import 'package:tourismandco/styles.dart';

class DefaultAppBar extends AppBar {
  final Widget title = Text('Tourism & Co', style: Styles.appBarTitle);
  final IconThemeData iconTheme = IconThemeData(color: Colors.black);
  final bool centerTitle = true;
  final Color backgroundColor = Colors.white;
  final double elevation = 0.5;
}