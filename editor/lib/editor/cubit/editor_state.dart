part of 'editor_cubit.dart';

@freezed
class EditorState with _$EditorState {
  const factory EditorState.selecting({
    required List<Offset> points,
  }) = _Selecting;
  const factory EditorState.selected({
    required List<Offset> points,
  }) = _Selected;
  const factory EditorState.error({
    required String message,
  }) = _Error;
}
