import 'dart:async';
import 'package:flutter/material.dart';
import 'components/banner_image.dart';
import 'components/default_app_bar.dart';
import 'components/location_tile.dart';
import 'models/location.dart';
import 'location_detail.dart';
import 'styles.dart';

const listItemHeight = 245.0;

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

      // await Future.delayed(Duration(milliseconds: 8000));
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
      appBar: DefaultAppBar(),
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
    return GestureDetector(
      onTap: () => _navigateToLocationDetail(context, location.id),
      child: Container(
        height: listItemHeight,
        child: Stack(
          children: [
            BannerImage(url: location.url, height: listItemHeight),
            _tileFooter(location),
          ],
        ),
      ),
    );
  }

  void _navigateToLocationDetail(BuildContext context, int locationID) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LocationDetail(locationID)),
    );
  }

  Widget _tileFooter(Location location) {
    final info = LocationTile(location: location, darkTheme: true);
    final overLay = Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: Styles.horizontalDefaultPadding),
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.7)),
      child: info,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [overLay],
    );
  }
}
