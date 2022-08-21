import 'package:flutter/material.dart';

class SpotyImageViewer extends StatelessWidget {
  SpotyImageViewer({
    super.key,
    this.onTap,
    required this.imageProvider,
    required this.points,
  });

  final void Function(Offset offset)? onTap;
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
  const _Point({required this.offset});

  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx - 20.0,
      top: offset.dy - 20.0,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
          ),
        ),
      ),
    );
  }
}
