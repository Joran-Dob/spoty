// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:editor/editor/editor.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EditorPage', () {
    group('route', () {
      test('is routable', () {
        expect(EditorPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders EditorView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: EditorPage()));
      expect(find.byType(EditorView), findsOneWidget);
    });
  });
}
