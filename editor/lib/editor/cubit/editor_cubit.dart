import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'editor_state.dart';
part 'editor_cubit.freezed.dart';

class EditorCubit extends Cubit<EditorState> {
  EditorCubit() : super(const EditorState.selected(points: []));

  final List<Offset> _points = [];

  FutureOr<void> onPointSelected({required Offset offset}) {
    emit(EditorState.selecting(points: _points));
    _points.add(offset);
    print(_points);
    emit(EditorState.selected(
      points: _points,
    ));
  }
}
