import 'package:flutter/material.dart';
import 'package:tourismandco/models/location.dart';
import 'package:tourismandco/styles.dart';

const double locationTitleHeight = 100.0;

class LocationTile extends StatelessWidget {
  final Location location;
  final bool darkTheme;

  LocationTile({super.key, required this.location, required this.darkTheme});

  @override
  Widget build(BuildContext context){
    final title = location.name.toUpperCase();
    final subTitle = location.userItinerarySummary.toUpperCase();
    final caption = location.tourPackageName.toUpperCase();

    return SizedBox(
      height: locationTitleHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: darkTheme? Styles.locationTileTitleDark : Styles.locationTileTitleLight
          ),
          Text(subTitle, style: Styles.locationTileSubTitle),
          Text(caption, style: Styles.locationTileCaption)
        ]
      )
    );

  }
}