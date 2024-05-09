import 'package:dinapp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyApp tests', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: MyApp()));

    // Verify if the initial UI is as expected
    expect(find.text('Ingresa tu nombre:'), findsOneWidget);
    expect(find.text('Generar'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);

    // Enter text into the TextField.
    await tester.enterText(find.byType(TextField), 'John Doe');
    await tester.pump();

    // Tap on the 'Generar' button.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Assuming a dinosaur name is generated, check if the text and image widgets are displayed.
    // This is more of a mock test, as the actual output depends on the random function which
    // should ideally be mocked for a predictable output.
    // For demonstration, this test assumes that a name and image will always be shown after tapping 'Generar'.
    expect(find.text('Tu dinosaurio:'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget); // This checks if any image is displayed
    expect(find.byType(Text), findsWidgets); // This checks for any text widgets
  });
}