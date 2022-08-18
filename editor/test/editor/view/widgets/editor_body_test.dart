// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:editor/editor/editor.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EditorBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => EditorCubit(),
          child: MaterialApp(home: EditorBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
