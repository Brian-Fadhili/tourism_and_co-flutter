import 'package:flutter/material.dart';
import 'package:tourismandco/styles.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Tourism & Co', style: Styles.appBarTitle),
      iconTheme: const IconThemeData(color: Colors.black),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.5,
    );
  }
}