import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:editor/editor/cubit/cubit.dart';
import 'package:spoty/spoty.dart';

/// {@template editor_body}
/// Body of the EditorPage.
///
/// Add what it does
/// {@endtemplate}
class EditorBody extends StatelessWidget {
  /// {@macro editor_body}
  EditorBody({Key? key}) : super(key: key);

  final _originalImageKey = GlobalKey();
  final _differenceImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final _editorCubit = BlocProvider.of<EditorCubit>(context);

    return BlocBuilder<EditorCubit, EditorState>(
      bloc: _editorCubit,
      builder: (context, state) {
        return state.maybeWhen(
          selected: (points) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: _ImageContainer(
                      key: _originalImageKey,
                      imageProvider: _editorCubit.originalImageProvider,
                      onTap: (offset) => _editorCubit.onPointSelected(
                        offset: offset,
                        height: _originalImageKey.currentContext?.size?.height ?? 0.0,
                        width: _originalImageKey.currentContext?.size?.width ?? 0.0,
                      ),
                      points: points,
                      onDragDone: _editorCubit.onDragDoneOriginal,
                    ),
                  ),
                  Flexible(
                    child: _ImageContainer(
                      imageProvider: _editorCubit.differenceImageProvider,
                      onTap: (offset) => _editorCubit.onPointSelected(
                        offset: offset,
                        height: _differenceImageKey.currentContext?.size?.height ?? 0.0,
                        width: _differenceImageKey.currentContext?.size?.width ?? 0.0,
                      ),
                      points: points,
                      onDragDone: _editorCubit.onDragDoneDifference,
                    ),
                  )
                ],
              ),
            ],
          ),
          orElse: SizedBox.new,
        );
      },
    );
  }
}

class _ImageContainer extends StatelessWidget {
  const _ImageContainer({
    Key? key,
    this.imageProvider,
    this.onTap,
    required this.points,
    required this.onDragDone,
  }) : super(key: key);

  final ImageProvider? imageProvider;
  final Function(Offset offset)? onTap;
  final List<Offset> points;
  final Function(DropDoneDetails details) onDragDone;

  @override
  Widget build(BuildContext context) {
    if (imageProvider == null) {
      return Padding(
        padding: const EdgeInsets.all(32.0),
        child: DropTarget(
          onDragDone: onDragDone,
          child: Container(
            height: 220.0,
            width: 320.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  32.0,
                ),
              ),
              border: Border.all(
                color: Colors.blueAccent.withOpacity(
                  .2,
                ),
                width: 1.0,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.drop,
                    size: 24.0,
                    color: Colors.blueAccent.withOpacity(
                      .8,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    "Drop Image Here",
                    style: TextStyle(
                      color: Colors.blueAccent.withOpacity(
                        .8,
                      ),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return SpotyImageViewer(
      imageProvider: imageProvider!,
      points: points,
      onTap: onTap,
    );
  }
}
