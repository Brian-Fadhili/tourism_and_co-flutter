import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:tourismandco/app.dart';
import 'package:tourismandco/mocks/mock_location.dart';

class MockHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}

void main() {
  setUpAll(() {
    HttpOverrides.global = MockHttpOverrides();
  });

  tearDownAll(() {
    HttpOverrides.global = null;
  });

  testWidgets('test app startup', (WidgetTester tester) async {
    await tester.pumpWidget(App());
    await tester.pumpAndSettle();

    final mockLocation = MockLocation.fetchAny();
    
    expect(find.text(mockLocation.name), findsOneWidget);
    expect(find.text("${mockLocation.name}blah"), findsNothing);

  });
}