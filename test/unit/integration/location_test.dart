import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:tourismandco/models/location.dart';

void main() {
  test('Test location deserialization', () {
    const locationJSON = 
    '{ "name": "Arashiyama Bamboo Grove, Kyoto, Japan", "url": "https://images.pexels.com/photos/37501475/pexels-photo-37501475.jpeg", "facts": [ { "title": "Summary", "text": "While we could go on about the ethereal glow and seemingly endless heights of this bamboo grove on the outskirts of Kyoto, the sights\'s pleasures extends beyond the visual realm." }, { "title": "How to Get There", "text": "Kyoto airport, with several terminals, is located 16 kilometers south of the city and is also known as Kyoto. Kyoto can also be reached by transport links from other regional airports." } ] }';

    final locationMap = json.decode(locationJSON) as Map<String, dynamic>;

    expect("Arashiyama Bamboo Grove, Kyoto, Japan", equals(locationMap['name']));

    final location = Location.fromJson(locationMap);
    expect(location.name, equals(locationMap['name']));
    expect(location.url, equals(locationMap['url']));
    
    expect(location.facts![0].title, matches(locationMap['facts'][0]['title']));
    expect(location.facts![0].text, matches(locationMap['facts'][0]['text']));

  });
}