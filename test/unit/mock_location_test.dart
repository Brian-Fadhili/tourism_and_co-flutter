// // ignore_for_file: non_constant_identifier_names

// import 'package:flutter_test/flutter_test.dart';
// import '../../lib/mocks/mock_location.dart';

// void main() {
//   test('test fetchAny', () {
//     final mockLocation = MockLocation.fetchAny();
//     expect(mockLocation, isNotNull);
//     expect(mockLocation.name, isNotNull);
//   });

//   test('test fetchAll', () {
//     final mockLocations = MockLocation.fetchAll();
//     expect(mockLocations.length, greaterThan(0));
//     expect(mockLocations[0].name, isNotNull);
//   });

//   test('test fetch', () {
//     final mockLocation = MockLocation.fetch(0);
//     expect(mockLocation, isNotNull);
//     expect(mockLocation.name, isNotNull);
//   });
// }