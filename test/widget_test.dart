// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trace_app/home/view/home_screen.dart';

void main() {
  group('HomeScreen counter tests', () {
    testWidgets('Counter starts at 0 and increments to 1', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: const HomeScreen()));

      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(find.text('1'), findsOneWidget);
      expect(find.text('0'), findsNothing);
    });

    testWidgets('Multiple increments update counter', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: const HomeScreen()));

      expect(find.text('0'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(find.text('2'), findsOneWidget);
    });

    testWidgets('FloatingActionButton is present and tappable', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: const HomeScreen()));

      final fab = find.byType(FloatingActionButton);
      expect(fab, findsOneWidget);

      await tester.tap(fab);
      await tester.pump();

      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('Tapping non-add widgets does not change counter', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: const HomeScreen()));

      expect(find.text('0'), findsOneWidget);

      // Try tapping the title or other widgets (if present)
      final title = find.text('Trace App'); // harmless if not found
      if (await tester.any(title)) {
        await tester.tap(title);
        await tester.pump();
      }

      expect(find.text('0'), findsOneWidget);
    });
  });
}
