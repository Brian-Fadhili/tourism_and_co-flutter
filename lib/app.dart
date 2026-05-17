import 'package:flutter/material.dart';
import 'mocks/mock_location.dart';
import 'location_list.dart';

class App extends StatelessWidget {
  final mockLocations = MockLocation.fetchAll();

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false, 
    home: LocationList(mockLocations)
  );
  }
  
}