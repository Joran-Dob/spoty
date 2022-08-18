import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:spoty/src/spoty_image_viewer.dart';

class Spoty extends StatelessWidget {
  const Spoty({
    Key? key,
    required this.differenceImageProvider,
    required this.originalImageProvider,
  }) : super(key: key);

  final ImageProvider originalImageProvider;
  final ImageProvider differenceImageProvider;

  @override
  Widget build(BuildContext context) {
    return const _Spoty();
  }
}

class _Spoty extends StatefulWidget {
  const _Spoty({Key? key}) : super(key: key);

  @override
  State<_Spoty> createState() => _SpotyState();
}

class _SpotyState extends State<_Spoty> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SpotyImageViewer(
                      imageProvider: const NetworkImage(
                        'https://i.postimg.cc/j52HZmZJ/Lazy-Ambolli-in-the-Dark-Woodsdiff.jpg',
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://i.postimg.cc/j52HZmZJ/Lazy-Ambolli-in-the-Dark-Woodsdiff.jpg',
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
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
