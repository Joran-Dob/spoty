import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SpotyImageViewer extends StatelessWidget {
  SpotyImageViewer({
    Key? key,
    this.onTap,
    required this.imageProvider,
    required this.points,
  }) : super(key: key);

  final Function(Offset offset)? onTap;
  final ImageProvider imageProvider;
  final List<Offset> points;
  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _key,
      onTapDown: _onTapDown,
      child: Stack(
        children: [
          Positioned(
            child: Image(
              image: imageProvider,
              fit: BoxFit.contain,
            ),
          ),
          ...points
              .map(
                (e) => _Point(
                  offset: e,
                ),
              )
              .toList(),
        ],
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    final box = _key.currentContext?.findRenderObject() as RenderBox?;
    final localPosition = box?.globalToLocal(details.globalPosition);
    final position = localPosition ?? details.globalPosition;
    onTap?.call(position);
  }
}

class _Point extends StatelessWidget {
  const _Point({Key? key, required this.offset}) : super(key: key);

  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx - 20.0,
      top: offset.dy - 20.0,
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
