import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:spoty/spoty.dart';

part 'spoty_state.dart';
part 'spoty_cubit.freezed.dart';

const _safeTapRange = 100.0;

class SpotyCubit extends Cubit<SpotyState> {
  SpotyCubit({
    this.configFile,
    this.configString,
  }) : super(SpotyState.initial()) {
    _init();
  }

  final File? configFile;
  final String? configString;
  SpotyImageConfig? imageConfig;
  List<SpotyImageConfigPosition> points = [];
  List<Offset> correctPoints = [];

  Future<void> _init() async {
    emit(const SpotyState.initial());
    var dataString = configString;
    if (configFile != null) {
      dataString = await configFile?.readAsString();
    }
    if (dataString != null) {
      emit(const SpotyState.loading());
      final data = jsonDecode(dataString) as Map<String, dynamic>;
      imageConfig = SpotyImageConfig.fromJson(data);
    }
    if (imageConfig != null) {
      points = imageConfig?.points ?? [];
      emit(
        SpotyState.loaded(
          imageConfig: imageConfig!,
          correctPoints: correctPoints,
        ),
      );
    } else {
      emit(const SpotyState.error());
    }
  }

  FutureOr<void> onPointSelected({required Offset offset, required double width, required double height,}) {
    emit(const SpotyState.loading());
    try {
      Offset? removePoint;
      for (final point in points) {
        final configPointX = point.xPercentage * ;
        final configPointY = point.yPercentage;
        final xPositionCorrect = (configPointX - _safeTapRange) < offset.dx &&
            (configPointX + _safeTapRange) > offset.dx;
        final yPositionCorrect = (configPointY - _safeTapRange) < offset.dy &&
            (configPointY + _safeTapRange) > offset.dy;
        if (xPositionCorrect && yPositionCorrect) {
          correctPoints.add(point);
          removePoint = point;
        }
      }
      if (removePoint != null) {
        points.remove(removePoint);
      }

      checkIfCompleted();
      emit(
        SpotyState.loaded(
          imageConfig: imageConfig!,
          correctPoints: correctPoints,
        ),
      );
    } catch (e) {
      emit(
        SpotyState.loaded(
          imageConfig: imageConfig!,
          correctPoints: correctPoints,
        ),
      );
    }
  }

  void checkIfCompleted() {
    if (points.isEmpty) {
      print('Found all diffs');
    }
  }
}
