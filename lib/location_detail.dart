import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'components/banner_image.dart';
import 'components/default_app_bar.dart';
import 'components/location_tile.dart';
import 'models/location.dart';
import 'styles.dart';

const double bannerImageHeight = 300.0;
const double verticalBodyPadding = 20.0;
const double footerHeight = 100;

class LocationDetail extends StatefulWidget {
  final int locationID;
  LocationDetail(this.locationID);

  @override
  createState() => _LocationDetailState();
}

class _LocationDetailState extends State<LocationDetail> {
  Location location = Location.blank();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final location = await Location.fetchByID(widget.locationID);

    if (mounted) {
      setState(() {
        this.location = location;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: Stack(
        children: [
          _renderBody(context, location),
          _renderFooter(context, location),
        ],
      ),
    );
  }

  Widget _renderBody(BuildContext context, Location location) {
    var result = <Widget>[];

    result.add(BannerImage(url: location.url, height: bannerImageHeight));
    result.add(_renderHeader());
    result.addAll(_renderFacts(location));
    result.add(_renderBottomSpacer());
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: result,
      ),
    );
  }

  Widget _renderHeader() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: verticalBodyPadding,
        horizontal: Styles.horizontalDefaultPadding,
      ),
      child: LocationTile(location: location, darkTheme: false),
    );
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
      padding: EdgeInsets.fromLTRB(
        Styles.horizontalDefaultPadding,
        25.0,
        Styles.horizontalDefaultPadding,
        0.0,
      ),
      child: Text(
        title.toUpperCase(),
        textAlign: TextAlign.left,
        style: Styles.headerText,
      ),
    );
  }

  Widget _sectionText(String text) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: Styles.horizontalDefaultPadding,
      ),
      child: Text(text, textAlign: TextAlign.left, style: Styles.smallText),
    );
  }

  Widget _renderFooter(BuildContext context, Location location) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.5)),
          height: footerHeight,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: _renderBookButton(),
          ),
        ),
      ],
    );
  }

  Widget _renderBookButton() {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Styles.accentColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      onPressed: _handleBookPress,
      child: Text('Book'.toUpperCase(), style: Styles.textCTAButton),
    );
  }

  Future<void> _handleBookPress() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'inquiries016@gmail.com',
      queryParameters: {
        'subject': 'Booking Inquiry',
        'body': 'Hello, I would like to book..',
      },
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }

  Widget _renderBottomSpacer() {
    return const SizedBox(height: footerHeight);
  }
}
