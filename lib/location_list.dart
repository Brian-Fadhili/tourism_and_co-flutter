import 'package:flutter/material.dart';
import 'models/location.dart';
import 'styles.dart';

class LocationList extends StatelessWidget {

  final List<Location> locations;
  LocationList(this.locations);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Locations", style: Styles.titleText),
      ),
      body: ListView.builder(                                                    
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.all(10.0),
            leading: _itemThumnail(locations[index]),
            title: _itemTile(locations[index]),
          );
        }
      ),
    );
  }

  Widget _itemThumnail(Location location) {
    return Container(
      constraints: BoxConstraints.tightFor(width: 100),
      child: Image.network(location.url, fit: BoxFit.cover),
    );
  }

  Widget _itemTile(Location location) {
    return Text(location.name, style: Styles.smallText);
  }
}