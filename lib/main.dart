import 'package:flutter/material.dart';
import 'location_detail.dart';
import 'models/location.dart';
import 'mocks/mock_location.dart';
void main() {
  final Location mockLocation = MockLocation.fetchAny();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, 
    home: LocationDetail(mockLocation),
  ));
}