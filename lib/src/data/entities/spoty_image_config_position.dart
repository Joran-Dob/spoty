import 'package:freezed_annotation/freezed_annotation.dart';

part 'spoty_image_config_position.freezed.dart';
part 'spoty_image_config_position.g.dart';

@freezed
class SpotyImageConfigPosition with _$SpotyImageConfigPosition {
  @JsonSerializable(explicitToJson: true)
  const factory SpotyImageConfigPosition({
    required String xPercentage,
    required String yPercentage,
  }) = _SpotyImageConfigPosition;

  factory SpotyImageConfigPosition.fromJson(Map<String, dynamic> json) =>
      _$SpotyImageConfigPositionFromJson(json);
}
