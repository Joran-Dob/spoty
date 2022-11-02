import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoty/src/cubit/spoty_cubit.dart';
import 'package:spoty/src/spoty_image_viewer.dart';

typedef SpotyDifferencesTextBuilder = String Function(
  int differences,
  int total,
);

class Spoty extends StatelessWidget {
  const Spoty({
    super.key,
    required this.differenceImageProvider,
    required this.originalImageProvider,
    this.configFile,
    this.configString,
    this.onAllDifferencesFound,
    this.differencesTextBuilder,
    this.differencesTextStyle,
  }) : assert(
          configFile != null || configString != null,
          'Config must be provided',
        );

  final ImageProvider originalImageProvider;
  final ImageProvider differenceImageProvider;
  final File? configFile;
  final String? configString;
  final VoidCallback? onAllDifferencesFound;
  final SpotyDifferencesTextBuilder? differencesTextBuilder;
  final TextStyle? differencesTextStyle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SpotyCubit>(
      create: (context) => SpotyCubit(
        configFile: configFile,
        configString: configString,
        onAllDifferencesFound: onAllDifferencesFound,
        originalImageProvider: originalImageProvider,
        differenceImageProvider: differenceImageProvider,
      ),
      child: _Spoty(
        differencesTextBuilder: differencesTextBuilder,
      ),
    );
  }
}

class _Spoty extends StatefulWidget {
  const _Spoty({
    this.differencesTextBuilder,
    this.differencesTextStyle,
  });

  final SpotyDifferencesTextBuilder? differencesTextBuilder;
  final TextStyle? differencesTextStyle;

  @override
  State<_Spoty> createState() => _SpotyState();
}

class _SpotyState extends State<_Spoty> {
  final _originalImageKey = GlobalKey();
  final _differenceImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final spotyCubit = BlocProvider.of<SpotyCubit>(context);

    return BlocBuilder<SpotyCubit, SpotyState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (imageConfig, correctPoints) => Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    SpotyImageViewer(
                      key: _originalImageKey,
                      imageProvider: spotyCubit.originalImageProvider,
                      points: correctPoints,
                      onTap: (offset) => spotyCubit.onPointSelected(
                        offset: offset,
                        width: _originalImageKey.currentContext?.size?.width ?? 0.0,
                        height: _originalImageKey.currentContext?.size?.height ?? 0.0,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    if (widget.differencesTextBuilder != null) ...[
                      Text(
                        widget.differencesTextBuilder!(
                          correctPoints.length,
                          imageConfig.points.length,
                        ),
                        style: widget.differencesTextStyle ??
                            const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 16.0),
                    ],
                    SpotyImageViewer(
                      key: _differenceImageKey,
                      imageProvider: spotyCubit.differenceImageProvider,
                      points: correctPoints,
                      onTap: (offset) => spotyCubit.onPointSelected(
                        offset: offset,
                        width: _differenceImageKey.currentContext?.size?.width ?? 0.0,
                        height: _differenceImageKey.currentContext?.size?.height ?? 0.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
          orElse: SizedBox.new,
        );
      },
    );
  }
}
