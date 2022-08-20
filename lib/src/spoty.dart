import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoty/src/cubit/spoty_cubit.dart';
import 'package:spoty/src/spoty_image_viewer.dart';

class Spoty extends StatelessWidget {
  const Spoty({
    Key? key,
    required this.differenceImageProvider,
    required this.originalImageProvider,
    this.configFile,
    this.configString,
  })  : assert(configFile != null || configString != null, "Config must be provided"),
        super(key: key);

  final ImageProvider originalImageProvider;
  final ImageProvider differenceImageProvider;
  final File? configFile;
  final String? configString;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SpotyCubit>(
      create: (context) => SpotyCubit(
        configFile: configFile,
        configString: configString,
      ),
      child: _Spoty(),
    );
  }
}

class _Spoty extends StatefulWidget {
  const _Spoty({Key? key}) : super(key: key);

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
            orElse: SizedBox.new);
      },
    );
  }

  void _onTapDown(TapDownDetails details) {
    final x = details.globalPosition.dx;
    final y = details.globalPosition.dy;
    // or user the local position method to get the offset
    print(details.localPosition);
    print('tap down $x, $y');
  }
}
