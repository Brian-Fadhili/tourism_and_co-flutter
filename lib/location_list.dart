import 'package:flutter/material.dart';
import 'models/location.dart';
import 'location_detail.dart';
import 'styles.dart';

class LocationList extends StatefulWidget {
  @override
  createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {

  List<Location> locations = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Locations", style: Styles.titleText),
      ),
      body: ListView.builder(                                                    
        itemCount: locations.length,
        itemBuilder: _itemBuilderListView,
      ),
    );
  }

  loadData() async {
  try {
    final locations = await Location.fetchAll();
    setState(() {
      this.locations = locations;
    });
  } catch (e) {
    print("Error loading locations: $e");
  }
}

  Widget _itemBuilderListView(BuildContext context, int index) {
    var location = locations[index];
    return ListTile(
            contentPadding: EdgeInsets.all(10.0),
            leading: _itemThumbnail(location),
            title: _itemTile(location),
            onTap: () {
              _navigateToLocationDetail(context, location.id);
            },
          );
  }

  void _navigateToLocationDetail(BuildContext context, int locationID) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => LocationDetail(locationID)
    ));
  }

  Widget _itemThumbnail(Location location) {
    return Container(
      constraints: BoxConstraints.tightFor(width: 100),
      child: Image.network(location.url, fit: BoxFit.cover),
    );
  }

  Widget _itemTile(Location location) {
    return Text(location.name, style: Styles.smallText);
  }
}