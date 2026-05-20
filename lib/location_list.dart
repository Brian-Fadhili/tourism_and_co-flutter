import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'models/location.dart';
import 'location_detail.dart';
import 'styles.dart';
import 'dart:async';

class LocationList extends StatefulWidget {
  @override
  createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  List<Location> locations = [];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      if (!mounted) return;
      setState(() => loading = true);
      
      await Future.delayed(Duration(milliseconds: 3000));
        final locations = await Location.fetchAll();
      if (!mounted) return;
      setState(() {
        this.locations = locations;
        loading = false;
      });
      
    } catch (e) {
      setState(() => loading = false);
      print("Error loading locations: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Locations", style: Styles.titleText),
        actions: [
          if(kIsWeb)
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: loadData,
          )
        ]
      ),
      body: RefreshIndicator(
        onRefresh: () => loadData(),
        child: Column(
          children: [
            _renderProgressBar(context),
            Expanded(child: _renderListView(context)),
          ],
        ),
      ),
    );
  }

  Widget _renderProgressBar(BuildContext context) {
    return loading
        ? LinearProgressIndicator(
            value: null,
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation(Colors.blue.shade200),
          )
        : Container();
  }

  Widget _renderListView(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: locations.length,
      itemBuilder: _itemBuilderListView,
    );
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
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LocationDetail(locationID)),
    );
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
