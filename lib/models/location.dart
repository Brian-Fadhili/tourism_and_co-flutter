import 'dart:convert';
import '../endpoint.dart';
import 'location_fact.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Location {
  final int id;
  final String name;
  final String url;
  final List<LocationFact>? facts;

  Location.blank() : id = 0, name = '', url = '', facts = null;

  Location({required this.id, required this.name, required this.url, this.facts});

  factory Location.fromJson(Map<String, dynamic> json) {
  return Location(
    id: int.parse(json['id'].toString()),
    name: json['name'],
    url: json['url'],
    facts: json['facts'] != null
        ? (json['facts'] as List).map((f) => LocationFact.fromJson(f)).toList()
        : null,
  );
}

  static Future<List<Location>> fetchAll() async {
    var uri = Endpoint.uri('/locations.php');

    final resp = await http.get(uri);

    if(resp.statusCode != 200) {
      throw (resp.body);
    }

    List<Location> list = [];
    for(var jsonItem in json.decode(resp.body)) {
      list.add(Location.fromJson(jsonItem));
    }
    return list;
  }

  static Future<Location> fetchByID(int id) async {
    var uri = Endpoint.uri('/locations.php', queryParameters: {'id': '$id'});

    final resp = await http.get(uri);

    if(resp.statusCode != 200) {
      throw(resp.body);
    }

    // final Map<String, dynamic> itemMap = json.decode(resp.body);
    // return Location.fromJson(itemMap);

    return Location.fromJson(json.decode(resp.body));
  }
}