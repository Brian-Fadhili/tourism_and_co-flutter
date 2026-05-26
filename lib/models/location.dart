import 'package:http/http.dart' as http;
import 'dart:convert';
import '../endpoint.dart';
import 'location_fact.dart';

class Location {
  final int id;
  final String name;
  final String url;
  final String userItinerarySummary;
  final String tourPackageName;
  final List<LocationFact>? facts;

  const Location.blank()
    : id = 0,
      name = '',
      url = '',
      userItinerarySummary = '',
      tourPackageName = '',
      facts = const [];

  Location({
    required this.id,
    required this.name,
    required this.url,
    required this.userItinerarySummary,
    required this.tourPackageName,
    required this.facts,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
      name: json['name'],
      url: json['url'] ?? '',
      userItinerarySummary: json['userItinerarySummary'] ?? '',
      tourPackageName: json['tourPackageName'] ?? '',
      facts: json['facts'] != null
          ? (json['facts'] as List)
                .map((f) => LocationFact.fromJson(f))
                .toList()
          : const [],
    );
  }

  static Future<List<Location>> fetchAll() async {
    var uri = Endpoint.uri('/locations.php');

    final resp = await http.get(uri);

    if (resp.statusCode != 200) {
      throw Exception(
        'failed to load locations: ${resp.statusCode} ${resp.body}',
      );
    }

    List<Location> list = [];
    for (var jsonItem in jsonDecode(resp.body)) {
      list.add(Location.fromJson(jsonItem));
    }
    return list;
  }

  static Future<Location> fetchByID(int id) async {
    var uri = Endpoint.uri('/locations.php', queryParameters: {'id': '$id'});
    final resp = await http.get(uri);

    if (resp.statusCode != 200) {
      throw Exception('failed to load location $id: ${resp.statusCode} ${resp.body}');
    }

    return Location.fromJson(json.decode(resp.body));
  }
}
