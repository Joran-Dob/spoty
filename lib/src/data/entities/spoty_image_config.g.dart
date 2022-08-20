// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spoty_image_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SpotyImageConfig _$$_SpotyImageConfigFromJson(Map<String, dynamic> json) =>
    _$_SpotyImageConfig(
      points: (json['points'] as List<dynamic>)
          .map((e) =>
              SpotyImageConfigPosition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SpotyImageConfigToJson(_$_SpotyImageConfig instance) =>
    <String, dynamic>{
      'points': instance.points.map((e) => e.toJson()).toList(),
    };
