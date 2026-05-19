import 'package:flutter/material.dart';
import 'models/location.dart';
import 'styles.dart';

class LocationDetail extends StatefulWidget {
  final int locationID;
  LocationDetail(this.locationID);

  @override
  createState() => _LocationDetailState(locationID);
}

class _LocationDetailState extends State<LocationDetail> {
  final int locationID;
  Location location = Location.blank();

  _LocationDetailState(this.locationID);

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
        title: Text(location.name, style: Styles.titleText),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _renderBody(context, location),
        ),
      ),
    );
  }

  void loadData() async {
    final location = await Location.fetchByID(locationID);

    if (mounted) {
      setState(() {
        this.location = location;
      }); 
    }
  }

  List<Widget> _renderBody(BuildContext context, Location location) {
    var result = <Widget>[];

    result.add(_bannerImage(location.url, 200.0));
    result.addAll(_renderFacts(location));
    return result;
  }

  List<Widget> _renderFacts(Location location) {
    var result = <Widget>[];

    if (location.facts == null || location.facts!.isEmpty) {
    return result; // return empty list safely while data loads
    }

    for (int i = 0; i < location.facts!.length; i++) {
      result.add(_sectionTitle(location.facts![i].title));
      result.add(_sectionText(location.facts![i].text));
    }
    return result;
  }

  Widget _sectionTitle(String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 10.0),
      child: Text(title, textAlign: TextAlign.left, style: Styles.headerText),
    );
  }

  Widget _sectionText(String text) {
    return Container(
      padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
      child: Text(text, textAlign: TextAlign.left, style: Styles.smallText),
    );
  }

  Widget _bannerImage(String url, double height) {
    Image? image;
    try {
      if(url.isNotEmpty) {
        image =Image.network(url, fit: BoxFit.cover);
      }
    }catch(e) {
      print("Could not load image from url: $url");
    }
    return Container(
      height: height,
      child: image,
    );
  }
}
