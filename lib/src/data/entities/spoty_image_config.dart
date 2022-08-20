import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spoty/src/data/entities/spoty_image_config_position.dart';

part 'spoty_image_config.freezed.dart';
part 'spoty_image_config.g.dart';

@freezed
class SpotyImageConfig with _$SpotyImageConfig {
  @JsonSerializable(explicitToJson: true)
  const factory SpotyImageConfig({
    required List<SpotyImageConfigPosition> points,
  }) = _SpotyImageConfig;

  factory SpotyImageConfig.fromJson(Map<String, dynamic> json) => _$SpotyImageConfigFromJson(json);
}
