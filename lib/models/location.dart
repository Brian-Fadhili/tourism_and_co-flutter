import 'location_fact.dart';

//Represents a location that a user can visit.
class Location {
  final String name;
  final String url;
  final List<LocationFact>? facts;

  Location({required this.name, required this.url, this.facts});
}