// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:editor/editor/cubit/cubit.dart';

void main() {
  group('EditorState', () {
    test('supports value equality', () {
      expect(
        EditorState(),
        equals(
          const EditorState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const EditorState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const editorState = EditorState(
            customProperty: 'My property',
          );
          expect(
            editorState.copyWith(),
            equals(editorState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const editorState = EditorState(
            customProperty: 'My property',
          );
          final otherEditorState = EditorState(
            customProperty: 'My property 2',
          );
          expect(editorState, isNot(equals(otherEditorState)));

          expect(
            editorState.copyWith(
              customProperty: otherEditorState.customProperty,
            ),
            equals(otherEditorState),
          );
        },
      );
    });
  });
}
