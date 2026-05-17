import 'package:flutter/material.dart';
import 'models/location.dart';
import 'mocks/mock_location.dart';
import 'styles.dart';

class LocationDetail extends StatelessWidget {
  final int locationID;

  LocationDetail(this.locationID);

  @override
  Widget build(BuildContext context) {
    var location = MockLocation.fetch(locationID);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(location.name, style: Styles.titleText),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _renderBody(context, location),
      ),
    );
  }

  List<Widget> _renderBody(BuildContext context, Location location) {
    var result = <Widget>[];

    result.add(_bannerImage(location.url, 200.0));
    result.addAll(_renderFacts(location));
    return result;
  }

  List<Widget> _renderFacts(Location location) {
    var result = <Widget>[];

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
    return Container(
      height: height,
      child: Image.network(url, fit: BoxFit.fitWidth),
    );
  }
}
