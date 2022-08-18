// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:editor/editor/cubit/cubit.dart';

void main() {
  group('EditorCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          EditorCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final editorCubit = EditorCubit();
      expect(editorCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<EditorCubit, EditorState>(
      'yourCustomFunction emits nothing',
      build: EditorCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <EditorState>[],
    );
  });
}
