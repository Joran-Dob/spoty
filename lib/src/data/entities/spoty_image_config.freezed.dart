// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'spoty_image_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SpotyImageConfig _$SpotyImageConfigFromJson(Map<String, dynamic> json) {
  return _SpotyImageConfig.fromJson(json);
}

/// @nodoc
mixin _$SpotyImageConfig {
  List<SpotyImageConfigPosition> get points =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpotyImageConfigCopyWith<SpotyImageConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpotyImageConfigCopyWith<$Res> {
  factory $SpotyImageConfigCopyWith(
          SpotyImageConfig value, $Res Function(SpotyImageConfig) then) =
      _$SpotyImageConfigCopyWithImpl<$Res>;
  $Res call({List<SpotyImageConfigPosition> points});
}

/// @nodoc
class _$SpotyImageConfigCopyWithImpl<$Res>
    implements $SpotyImageConfigCopyWith<$Res> {
  _$SpotyImageConfigCopyWithImpl(this._value, this._then);

  final SpotyImageConfig _value;
  // ignore: unused_field
  final $Res Function(SpotyImageConfig) _then;

  @override
  $Res call({
    Object? points = freezed,
  }) {
    return _then(_value.copyWith(
      points: points == freezed
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<SpotyImageConfigPosition>,
    ));
  }
}

/// @nodoc
abstract class _$$_SpotyImageConfigCopyWith<$Res>
    implements $SpotyImageConfigCopyWith<$Res> {
  factory _$$_SpotyImageConfigCopyWith(
          _$_SpotyImageConfig value, $Res Function(_$_SpotyImageConfig) then) =
      __$$_SpotyImageConfigCopyWithImpl<$Res>;
  @override
  $Res call({List<SpotyImageConfigPosition> points});
}

/// @nodoc
class __$$_SpotyImageConfigCopyWithImpl<$Res>
    extends _$SpotyImageConfigCopyWithImpl<$Res>
    implements _$$_SpotyImageConfigCopyWith<$Res> {
  __$$_SpotyImageConfigCopyWithImpl(
      _$_SpotyImageConfig _value, $Res Function(_$_SpotyImageConfig) _then)
      : super(_value, (v) => _then(v as _$_SpotyImageConfig));

  @override
  _$_SpotyImageConfig get _value => super._value as _$_SpotyImageConfig;

  @override
  $Res call({
    Object? points = freezed,
  }) {
    return _then(_$_SpotyImageConfig(
      points: points == freezed
          ? _value._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<SpotyImageConfigPosition>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_SpotyImageConfig implements _SpotyImageConfig {
  const _$_SpotyImageConfig(
      {required final List<SpotyImageConfigPosition> points})
      : _points = points;

  factory _$_SpotyImageConfig.fromJson(Map<String, dynamic> json) =>
      _$$_SpotyImageConfigFromJson(json);

  final List<SpotyImageConfigPosition> _points;
  @override
  List<SpotyImageConfigPosition> get points {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  String toString() {
    return 'SpotyImageConfig(points: $points)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SpotyImageConfig &&
            const DeepCollectionEquality().equals(other._points, _points));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_points));

  @JsonKey(ignore: true)
  @override
  _$$_SpotyImageConfigCopyWith<_$_SpotyImageConfig> get copyWith =>
      __$$_SpotyImageConfigCopyWithImpl<_$_SpotyImageConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SpotyImageConfigToJson(
      this,
    );
  }
}

abstract class _SpotyImageConfig implements SpotyImageConfig {
  const factory _SpotyImageConfig(
          {required final List<SpotyImageConfigPosition> points}) =
      _$_SpotyImageConfig;

  factory _SpotyImageConfig.fromJson(Map<String, dynamic> json) =
      _$_SpotyImageConfig.fromJson;

  @override
  List<SpotyImageConfigPosition> get points;
  @override
  @JsonKey(ignore: true)
  _$$_SpotyImageConfigCopyWith<_$_SpotyImageConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
