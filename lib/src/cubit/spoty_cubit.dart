import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spoty/spoty.dart';

part 'spoty_state.dart';
part 'spoty_cubit.freezed.dart';

const _safeTapRange = 20.0;

class SpotyCubit extends Cubit<SpotyState> {
  SpotyCubit({
    this.configFile,
    this.configString,
    this.onAllDifferencesFound,
  }) : super(const SpotyState.initial()) {
    _init();
  }

  final File? configFile;
  final String? configString;
  final VoidCallback? onAllDifferencesFound;
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
      points = imageConfig?.points.toList() ?? [];
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

  FutureOr<void> onPointSelected({
    required Offset offset,
    required double width,
    required double height,
  }) {
    emit(const SpotyState.loading());
    try {
      int? removePointIndex;
      for (final point in points) {
        final configPointX = double.parse(point.xPercentage) * width;
        final configPointY = double.parse(point.yPercentage) * height;
        final xPositionCorrect = (configPointX - _safeTapRange) < offset.dx &&
            (configPointX + _safeTapRange) > offset.dx;
        final yPositionCorrect = (configPointY - _safeTapRange) < offset.dy &&
            (configPointY + _safeTapRange) > offset.dy;
        if (xPositionCorrect && yPositionCorrect) {
          correctPoints.add(Offset(configPointX, configPointY));
          removePointIndex = points.indexOf(point);
        }
      }
      if (removePointIndex != null) {
        points.removeAt(removePointIndex);
      }
      if (onAllDifferencesFound != null) {
        checkIfCompleted();
      }
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
      onAllDifferencesFound?.call();
    }
  }
}
