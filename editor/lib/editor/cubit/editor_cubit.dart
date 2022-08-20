import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:editor/editor/editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spoty/spoty.dart';

part 'editor_state.dart';
part 'editor_cubit.freezed.dart';

class EditorCubit extends Cubit<EditorState> {
  EditorCubit() : super(const EditorState.selected(points: []));

  final List<Offset> _points = [];
  final List<SpotyImageConfigPosition> _imageConfigPoints = [];
  ImageProvider? originalImageProvider;
  ImageProvider? differenceImageProvider;

  FutureOr<void> onPointSelected({
    required Offset offset,
    double width = 0.0,
    double height = 0.0,
  }) {
    emit(EditorState.selecting(points: _points));
    _points.add(offset);
    _imageConfigPoints.add(
      SpotyImageConfigPosition(
        xPercentage: (offset.dx / width).toString(),
        yPercentage: (offset.dy / height).toString(),
      ),
    );
    emit(EditorState.selected(points: _points));
  }

  FutureOr<void> onDragDoneOriginal(DropDoneDetails details) async {
    emit(EditorState.selecting(points: _points));
    originalImageProvider = await dropDoneToImage(details);
    emit(EditorState.selected(points: _points));
  }

  FutureOr<void> onDragDoneDifference(DropDoneDetails details) async {
    emit(EditorState.selecting(points: _points));
    differenceImageProvider = await dropDoneToImage(details);
    emit(EditorState.selected(points: _points));
  }

  FutureOr<ImageProvider> dropDoneToImage(DropDoneDetails details) async {
    final file = details.files[0];
    final Uint8List bytes = await file.readAsBytes();
    return Image.memory(bytes).image;
  }

  SpotyImageConfig generateConfig() {
    return SpotyImageConfig(
      points: _imageConfigPoints,
    );
  }

  FutureOr<void> copyConfig() {
    final config = generateConfig();
    Clipboard.setData(
      ClipboardData(
        text: jsonEncode(config.toJson()),
      ),
    );
  }

  Future<FutureOr<void>> saveConfig() async {
    String? outputFile = await FilePicker.platform.saveFile(
      dialogTitle: 'Please select an output file:',
      fileName: 'config.json',
    );

    if (outputFile != null) {
      final file = File(outputFile);
      final config = generateConfig();
      file.writeAsString(jsonEncode(config.toJson()));
    }
  }
}
