part of 'spoty_cubit.dart';

@freezed
class SpotyState with _$SpotyState {
  const factory SpotyState.initial() = _Initial;
  const factory SpotyState.loading() = _Loading;
  const factory SpotyState.loaded({
    required SpotyImageConfig imageConfig,
    required List<Offset> correctPoints,
  }) = _Loaded;
  const factory SpotyState.error() = _Error;
}
