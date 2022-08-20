// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'spoty_image_config_position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SpotyImageConfigPosition _$SpotyImageConfigPositionFromJson(
    Map<String, dynamic> json) {
  return _SpotyImageConfigPosition.fromJson(json);
}

/// @nodoc
mixin _$SpotyImageConfigPosition {
  String get xPercentage => throw _privateConstructorUsedError;
  String get yPercentage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpotyImageConfigPositionCopyWith<SpotyImageConfigPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpotyImageConfigPositionCopyWith<$Res> {
  factory $SpotyImageConfigPositionCopyWith(SpotyImageConfigPosition value,
          $Res Function(SpotyImageConfigPosition) then) =
      _$SpotyImageConfigPositionCopyWithImpl<$Res>;
  $Res call({String xPercentage, String yPercentage});
}

/// @nodoc
class _$SpotyImageConfigPositionCopyWithImpl<$Res>
    implements $SpotyImageConfigPositionCopyWith<$Res> {
  _$SpotyImageConfigPositionCopyWithImpl(this._value, this._then);

  final SpotyImageConfigPosition _value;
  // ignore: unused_field
  final $Res Function(SpotyImageConfigPosition) _then;

  @override
  $Res call({
    Object? xPercentage = freezed,
    Object? yPercentage = freezed,
  }) {
    return _then(_value.copyWith(
      xPercentage: xPercentage == freezed
          ? _value.xPercentage
          : xPercentage // ignore: cast_nullable_to_non_nullable
              as String,
      yPercentage: yPercentage == freezed
          ? _value.yPercentage
          : yPercentage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_SpotyImageConfigPositionCopyWith<$Res>
    implements $SpotyImageConfigPositionCopyWith<$Res> {
  factory _$$_SpotyImageConfigPositionCopyWith(
          _$_SpotyImageConfigPosition value,
          $Res Function(_$_SpotyImageConfigPosition) then) =
      __$$_SpotyImageConfigPositionCopyWithImpl<$Res>;
  @override
  $Res call({String xPercentage, String yPercentage});
}

/// @nodoc
class __$$_SpotyImageConfigPositionCopyWithImpl<$Res>
    extends _$SpotyImageConfigPositionCopyWithImpl<$Res>
    implements _$$_SpotyImageConfigPositionCopyWith<$Res> {
  __$$_SpotyImageConfigPositionCopyWithImpl(_$_SpotyImageConfigPosition _value,
      $Res Function(_$_SpotyImageConfigPosition) _then)
      : super(_value, (v) => _then(v as _$_SpotyImageConfigPosition));

  @override
  _$_SpotyImageConfigPosition get _value =>
      super._value as _$_SpotyImageConfigPosition;

  @override
  $Res call({
    Object? xPercentage = freezed,
    Object? yPercentage = freezed,
  }) {
    return _then(_$_SpotyImageConfigPosition(
      xPercentage: xPercentage == freezed
          ? _value.xPercentage
          : xPercentage // ignore: cast_nullable_to_non_nullable
              as String,
      yPercentage: yPercentage == freezed
          ? _value.yPercentage
          : yPercentage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_SpotyImageConfigPosition implements _SpotyImageConfigPosition {
  const _$_SpotyImageConfigPosition(
      {required this.xPercentage, required this.yPercentage});

  factory _$_SpotyImageConfigPosition.fromJson(Map<String, dynamic> json) =>
      _$$_SpotyImageConfigPositionFromJson(json);

  @override
  final String xPercentage;
  @override
  final String yPercentage;

  @override
  String toString() {
    return 'SpotyImageConfigPosition(xPercentage: $xPercentage, yPercentage: $yPercentage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SpotyImageConfigPosition &&
            const DeepCollectionEquality()
                .equals(other.xPercentage, xPercentage) &&
            const DeepCollectionEquality()
                .equals(other.yPercentage, yPercentage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(xPercentage),
      const DeepCollectionEquality().hash(yPercentage));

  @JsonKey(ignore: true)
  @override
  _$$_SpotyImageConfigPositionCopyWith<_$_SpotyImageConfigPosition>
      get copyWith => __$$_SpotyImageConfigPositionCopyWithImpl<
          _$_SpotyImageConfigPosition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SpotyImageConfigPositionToJson(
      this,
    );
  }
}

abstract class _SpotyImageConfigPosition implements SpotyImageConfigPosition {
  const factory _SpotyImageConfigPosition(
      {required final String xPercentage,
      required final String yPercentage}) = _$_SpotyImageConfigPosition;

  factory _SpotyImageConfigPosition.fromJson(Map<String, dynamic> json) =
      _$_SpotyImageConfigPosition.fromJson;

  @override
  String get xPercentage;
  @override
  String get yPercentage;
  @override
  @JsonKey(ignore: true)
  _$$_SpotyImageConfigPositionCopyWith<_$_SpotyImageConfigPosition>
      get copyWith => throw _privateConstructorUsedError;
}
