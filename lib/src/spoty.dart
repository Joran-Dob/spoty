import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoty/src/cubit/spoty_cubit.dart';
import 'package:spoty/src/spoty_image_viewer.dart';

class Spoty extends StatelessWidget {
  const Spoty({
    super.key,
    required this.differenceImageProvider,
    required this.originalImageProvider,
    this.configFile,
    this.configString,
    this.onAllDifferencesFound,
  }) : assert(
          configFile != null || configString != null,
          'Config must be provided',
        );

  final ImageProvider originalImageProvider;
  final ImageProvider differenceImageProvider;
  final File? configFile;
  final String? configString;
  final VoidCallback? onAllDifferencesFound;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SpotyCubit>(
      create: (context) => SpotyCubit(
        configFile: configFile,
        configString: configString,
        onAllDifferencesFound: onAllDifferencesFound,
      ),
      child: const _Spoty(),
    );
  }
}

class _Spoty extends StatefulWidget {
  const _Spoty();

  @override
  State<_Spoty> createState() => _SpotyState();
}

class _SpotyState extends State<_Spoty> {
  final _originalImageKey = GlobalKey();
  final _differenceImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final spotyConfig = BlocProvider.of<SpotyCubit>(context);

    return BlocBuilder<SpotyCubit, SpotyState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (imageConfig, correctPoints) => Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SpotyImageViewer(
                            key: _originalImageKey,
                            imageProvider: const NetworkImage(
                              'https://i.postimg.cc/j52HZmZJ/Lazy-Ambolli-in-the-Dark-Woodsdiff.jpg',
                            ),
                            points: correctPoints,
                            onTap: (offset) => spotyConfig.onPointSelected(
                              offset: offset,
                              width: _originalImageKey.currentContext?.size?.width ?? 0.0,
                              height: _originalImageKey.currentContext?.size?.height ?? 0.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SpotyImageViewer(
                            key: _differenceImageKey,
                            imageProvider: const NetworkImage(
                              'https://i.postimg.cc/j52HZmZJ/Lazy-Ambolli-in-the-Dark-Woodsdiff.jpg',
                            ),
                            points: correctPoints,
                            onTap: (offset) => spotyConfig.onPointSelected(
                              offset: offset,
                              width: _differenceImageKey.currentContext?.size?.width ?? 0.0,
                              height: _differenceImageKey.currentContext?.size?.height ?? 0.0,
                            ),
                          ),
                        ],
                      ),
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
